import math
import os
from pyannote.audio import Pipeline
from pydub import AudioSegment


def getAsMinSec(f: float) -> str :
    min = math.floor(f / 60.0) 
    sec = f - (min * 60.0)
    return str(min) + ":" + str(sec)



# 1. visit hf.co/pyannote/segmentation and accept user conditions
# 2. visit hf.co/settings/tokens to create an access token
# 3. instantiate pretrained voice activity detection pipeline
print ("audio pipeline starting")
print ("loading stage1 pipeline (pyannote/voice-activity-detection)")
stage1 = Pipeline.from_pretrained("pyannote/voice-activity-detection",
                                   use_auth_token="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")


print ("running stage1")

with os.scandir("stage1") as it:
    for entry in it:
        if not entry.name.startswith('.') and entry.is_file():
            print("processing:", entry.name)
            output = stage1(entry.name)
            print ("done processing")

            segment = 1
            maxFragmentTime = 20.0
            totalTime = 0.0
            currentFragmentStart = 0.0
            prevSpeechEnd = 0.0
            for speech in output.get_timeline().support(1.0):
                # active speech between speech.start and speech.end
                print ("found a speech block!")
                print ("\tstart=", getAsMinSec(speech.start) )
                print ("\tend=", getAsMinSec(speech.end) )
                # skip any blank pause at the beginning
                if currentFragmentStart == 0.0:
                    currentFragmentStart = speech.start
                totalTime = speech.end - currentFragmentStart
                # does this new speech block make things too long?
                if totalTime > maxFragmentTime:
                    # dump out everythign until the last block
                    t1 = currentFragmentStart * 1000 # works  in milliseconds
                    t2 = prevSpeechEnd * 1000
                    newAudio = AudioSegment.from_wav(entry.name)
                    newAudio = newAudio[t1:t2]
                    # exports to a wav file in the current path
                    outputFile = entry.name[:-4] + "." + str(segment) +".wav"
                    outputFilePath = "stage2/" + outputFile
                    newAudio.export(outputFilePath, format="wav") 
                    print ("\tcreated ", outputFilePath )

                    metadata = f'{{ \"masterAudioFile\": \"{entry.name + ".master"}\", \"audioFragmentFile\": \"{outputFile}\", \"segmentLength\": \"{prevSpeechEnd-currentFragmentStart}\", \"st_mtime\": {entry.stat().st_mtime} }}'
                    print("json:", metadata)
                    with open(outputFilePath + ".json", "w") as outfile:
                        outfile.write(metadata)

                    segment += 1
                    currentFragmentStart = prevSpeechEnd
                    totalTime = 0.0
                # remember this speech block
                prevSpeechEnd = speech.end
            # all done processing it, move the master file to the next stage
            os.rename(entry.path, "./stage2/" + entry.name + ".master")


print ("exiting stage1")
                

