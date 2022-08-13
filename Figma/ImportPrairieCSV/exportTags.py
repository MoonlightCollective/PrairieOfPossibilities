# exportTags.py
# expects CSV format to be the following, with no header row
#   tagName, fixtureId, fixtureId, fixtureId, fixtureId
#
# e.g.
#   CenterClearing,222,251,284,315,349,383

import csv
from itertools import count
from math import fabs
from operator import truediv
from random import triangular
import sys
import json

if len(sys.argv) != 2:
    print (f'missing cmd args, argv={sys.argv}')
    sys.exit()

print(f'adding tags from (./exportTags.csv) to ({sys.argv[1]})')

# open the JSON file
jsonData  = json.loads(open(sys.argv[1]).read())
children = jsonData ['children']
print(f'found {len(children)} fixtures total')

# open the tag file
tags = []
with open('exportTags.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        tags.append(row)
#        print(f'\t{row[0]} = {row}')
print(f'found {len(tags)} fixtures to tag')

addedTagCount = 0
skippedTagCount = 0

for row in tags:
    rowTag = row[0]
    skippedFirst = False
    for num in row:
        if skippedFirst is False:
            skippedFirst = True
            continue
        existingTags = children[int(num)]['tags']
        found = False
        for tag in existingTags:
            if tag == rowTag:
                found = True
                skippedTagCount += 1
        if found is False:
            existingTags.append(rowTag)
            children[int(num)]['tags'] = existingTags
            addedTagCount += 1

#for fixture in children:
#    existTags = fixture['tags']
#    print(f'fixture.tags = {existTags}')

print(f'added ({addedTagCount}) tags skipped ({skippedTagCount}) tags to output.json')

with open("output.json", "w") as outputFile:
    json.dump(jsonData , outputFile, indent=2)
