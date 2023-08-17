import math
import os
import time
from pyannote.audio import Pipeline
from pydub import AudioSegment


def getAsMinSec(f: float) -> str :
    min = math.floor(f / 60.0) 
    sec = f - (min * 60.0)
    return str(min) + ":" + str(sec)

def exportAudio(segment, entry, prevSpeechEnd, currentFragmentStart):
    # dump out everythign until the last block
    t1 = currentFragmentStart * 1000 # works  in milliseconds
    t2 = prevSpeechEnd * 1000

    os.system("normalize " + entry.path)

    newAudio = AudioSegment.from_wav(entry.path)
    newAudio = newAudio[t1:t2]

    outputFile = entry.name[:-4] + "." + str(segment) +".wav"
    outputFilePath = "stage2/" + outputFile

    # write the JSON first, once the wav file appears it expects the JSON
    # to already be there
    metadata = f'{{ \"masterAudioFile\": \"{entry.name + ".master"}\", \"audioFragmentFile\": \"{outputFile}\", \"segmentLength\": \"{prevSpeechEnd-currentFragmentStart}\", \"st_mtime\": {entry.stat().st_mtime} }}'
    #print("json:", metadata)
    with open(outputFilePath + ".json", "w") as outfile:
        outfile.write(metadata)

    # exports to a wav file in stage2
    newAudio.export(outputFilePath, format="wav") 
    #print ("\tcreated ", outputFilePath )

# 1. visit hf.co/pyannote/segmentation and accept user conditions
# 2. visit hf.co/settings/tokens to create an access token
# 3. instantiate pretrained voice activity detection pipeline
print ("audio pipeline starting")
print ("loading stage1 pipeline (pyannote/voice-activity-detection)")
stage1 = Pipeline.from_pretrained("pyannote/voice-activity-detection",
                                   use_auth_token="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")


print ("running stage1...")

while True:
    print ("scanning ./stage1")
    with os.scandir("stage1") as it:
        for entry in it:
            if not entry.name.startswith('.') and entry.is_file():
                print("processing:", entry.name)
                try:
                    output = stage1(entry.path)
                    segment = 1
                    minFragmentTime = 4.0
                    maxFragmentTime = 20.0
                    totalTime = 0.0
                    currentFragmentStart = 0.0
                    prevSpeechEnd = 0.0
                    fragmentIndex = 0
                    fragments = output.get_timeline().support(1.0)
                    # find speech fragments and group until > 20 seconds of speech 
                    for speech in fragments:
                        # active speech between speech.start and speech.end
                        # print ("found a speech block!")
                        # print ("\tstart=", getAsMinSec(speech.start) )
                        # print ("\tend=", getAsMinSec(speech.end) )
                        # skip any blank pause at the beginning
                        if currentFragmentStart == 0.0:
                            currentFragmentStart = speech.start
                        totalTime = speech.end - currentFragmentStart

                        # are we in the sweet spot? (between 4 - 20 sec)
                        if totalTime > minFragmentTime and totalTime < maxFragmentTime:

                            exportAudio(segment, entry, speech.end, currentFragmentStart)
                            print("\tsegment length 1 = ", speech.end-currentFragmentStart)

                            segment += 1
                            currentFragmentStart = 0.0
                            totalTime = 0.0
                        elif(totalTime > maxFragmentTime and prevSpeechEnd == 0):
                            # this is one big block 

                            exportAudio(segment, entry, speech.end, currentFragmentStart)
                            print("\tsegment length 2 = ", totalTime)

                            segment += 1
                            currentFragmentStart = 0.0
                            totalTime = 0.0
                        elif(fragmentIndex == len(fragments)-1 and totalTime > minFragmentTime):
                            # grab the tail 
                            exportAudio(segment, entry, totalTime, currentFragmentStart)
                            print("\tsegment length 3 = ", speech.end-currentFragmentStart)

                        # remember this speech block
                        prevSpeechEnd = speech.end 
                        fragmentIndex += 1 

                except Exception as e: 
                    print ("hit an error, ignoring")
                    print (e)
                # all done processing it, move the master file to the next stage
                os.rename(entry.path, "./stage2/" + entry.name + ".master")
                
                print ("done processing")

    print ("sleeping 10s")
    time.sleep(10)

                

