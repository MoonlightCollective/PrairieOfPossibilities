import os
from transformers import Wav2Vec2Processor, Wav2Vec2ConformerForCTC, pipeline
import torch
import librosa as lb
import json
import time

print ("stage2 audio pipeline starting")

# load model and processor
print ("loading stage2 processoer")
processor = Wav2Vec2Processor.from_pretrained("facebook/wav2vec2-conformer-rope-large-960h-ft")
print ("loading stage2 conformer")
model = Wav2Vec2ConformerForCTC.from_pretrained("facebook/wav2vec2-conformer-rope-large-960h-ft")
print ("loading stage2 classifier")
classifier = pipeline("text-classification",model='bhadresh-savani/distilbert-base-uncased-emotion', top_k=None)

print ("running stage2...")

while True:
    print ("scanning ./stage2")
    with os.scandir("stage2") as it:
        for entry in it:
            if not entry.name.startswith('.') and entry.is_file() and entry.name.endswith('.master'):
                # move the master file unprocessed 
                os.rename(entry.path, "./stage3/" + entry.name)

            if not entry.name.startswith('.') and entry.is_file() and entry.name.endswith('.wav'):
                print("loading:", entry.name)
                data, samplerate = lb.load(entry.path, sr = 16000)
                # tokenize 
                input_values = processor(data, sampling_rate=samplerate, return_tensors="pt", padding="longest").input_values
                # retrieve logits
                logits = model(input_values).logits
                # take argmax and decode
                predicted_ids = torch.argmax(logits, dim=-1)
                print ("running speech to text...")
                transcription = processor.batch_decode(predicted_ids)
                print ("running emotion classifier...")
                prediction = classifier(transcription)
                #open the json file
                print("opening ", entry.path + ".json")
                with open(entry.path + ".json", 'r') as inputfile:
                    # Reading from json file
                    json_object = json.load(inputfile)
                json_object["text"] = transcription[0]
                json_object["classifier"] = prediction[0]

                #metadata = f'{{ \"audioFile\": \"{entry.name}\", \"text\": \"{transcription[0]}\",\"classifier\": {json.dumps(prediction[0])} }}'
                print("json:", json_object)

                outfilePath = "./stage3/" + entry.name
                with open(outfilePath + ".json", "w") as outfile:
                    outfile.write(json.dumps(json_object))

                print ("done processing")

                # all done processing it, delete the json file (we created a new one)
                os.remove(entry.path + ".json")
                # and move the audio file
                os.rename(entry.path, outfilePath)
    print ("sleeping 10s")
    time.sleep(10)

