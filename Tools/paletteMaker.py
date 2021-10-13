import sys
import csv
import colorsys

HELP_MSG = 'USAGE: paletteMaker <input file name>'

class PaletteEntry:
	def __init__(self,pName,c1,c2,c3,c4,c5) -> None:
		self.pName = pName
		self.colors = [c1,c2,c3,c4,c5]
	
	def printValues(self):
		print(f'{self.pName}:{self.colors}')
	
	def printSwatchEntryOpen(self,id):
		print(f'''{{
            "id": {id},
            "class": "heronarts.lx.color.LXSwatch",
            "internal": {{
              "modulationColor": 0
            }},
            "parameters": {{
              "label": "{self.pName}",
              "recall": false,
              "autoCycleEligible": true
            }},
            "children": {{}},
			"colors":[
			''')

	def printSwatchEntryClose(self):
		print (''']},''')

	def printSwatchColors(self,idStart):
		id = idStart;
		for entryDex in range(0,5):
			self.printSwatchColor(id,self.colors[entryDex],entryDex>3)
			id += 1
		return id

	def printSwatchColor(self,id,colorTuple,isLast):
		lastComma = '' if isLast else ','

		print (f'''
              {{
                "id": {id},
                "class": "heronarts.lx.color.LXDynamicColor",
                "internal": {{
                  "modulationColor": 0
                }},
                "parameters": {{
                  "label": "LX",
                  "mode": 0,
                  "period": 30.0,
                  "primary/brightness": {str(float(colorTuple[2]))},
                  "primary/saturation": {str(float(colorTuple[1]))},
                  "primary/hue": {str(float(colorTuple[0]))},
                  "secondary/brightness": 100.0,
                  "secondary/saturation": {str(float(colorTuple[1]))},
                  "secondary/hue": {str(float(colorTuple[0]))}
                }},
                "children": {{}}
              }} {lastComma}
		''')

		

def printSwatchesOpen(idStart):
	print(f''' "swatches": [
			''')

def printSwatchesClose():
	print(f"]")

def hsvFromRGBEntry(rgbEntry):
	splitStr=rgbEntry.split(',')
	# print(f'split:{splitStr}')
	rStr,gStr,bStr=splitStr;
	r = float(rStr)/255.0
	g = float(gStr)/255.0
	b = float(bStr)/255.0
	hsv = colorsys.rgb_to_hsv(r,g,b)
	# print(f'{rgbEntry}=>{hsv}')
	hsvInt = ((float(hsv[0]*360.0)),(float(hsv[1]*100.0)),(float(hsv[2]*100.0)))
	return hsvInt


### MAIN

if len(sys.argv) < 2:
	print(f'{HELP_MSG}')
	exit(-1)

with open(sys.argv[1]) as csvFile:
	csvReader = csv.DictReader(csvFile, delimiter=',')
	lineCount = 0;
	pEntries = []
	for row in csvReader:
		paletteName = row["Palette name"]
		c1HSV = hsvFromRGBEntry(row["Color 1"])
		c2HSV = hsvFromRGBEntry(row["Color 2 (primary)"])
		c3HSV = hsvFromRGBEntry(row["Color 3"])
		c4HSV = hsvFromRGBEntry(row["Accent 1"])
		c5HSV = hsvFromRGBEntry(row["Accent 2"])
		entry = PaletteEntry(paletteName,c1HSV,c2HSV,c3HSV,c4HSV,c5HSV);
		pEntries.append(entry);
	
	# for entry in pEntries:
		# entry.printValues()
	startId = int(50000)
	nextId = startId;
	printSwatchesOpen(nextId)
	nextId += 1
	for entry in pEntries:
		entry.printSwatchEntryOpen(nextId)
		nextId += 1
		nextId = entry.printSwatchColors(nextId)
		entry.printSwatchEntryClose()
		
	printSwatchesClose()
	
		
