import os
import json
import time

print ("parsing stage3...")

print ("scanning ./")
with os.scandir(".") as it:
    for entry in it:
        if not entry.name.startswith('.') and entry.is_file() and entry.name.endswith('.json'):
            with open(entry.path, 'r') as inputfile:
                # Reading from json file
                json_object = json.load(inputfile)

            #metadata = f'{{ \"audioFile\": \"{entry.name}\", \"text\": \"{transcription[0]}\",\"classifier\": {json.dumps(prediction[0])} }}'
            print(entry.name[:-5], ",", int(float(json_object["segmentLength"])))

print ("done processing")


