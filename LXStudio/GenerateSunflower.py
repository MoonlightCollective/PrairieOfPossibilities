from typing import List
import sys, getopt
import json
import math

class BaseFixture(object):
  def __init__(self, x:int, z:int, tags:str ):
    self.type = "7-pixel-base"
    self.x = x
    self.z = z
    self.tags = tags

class Protocol(object):
  def __init__(self, host:str, universe:int, start:int, num:int):
    self.host = host
    self.protocol = "artnet"
    self.byteOrder = "rgb"
    self.universe = universe
    self.start = start
    self.num = num

class Fixture(object):
  def __init__(self, label:str, comment:str, children:List[BaseFixture], outputs:List[Protocol]):
    self.label = label
    self.comment = comment
    self.children = children
    self.outputs = outputs

bases = []

FEET = 12 #using 1 = 1 inch
NUM_BASES = 450
POINTS_PER_BASE = 7
CENTER_DIAMETER = 40*FEET
SPACING_START = 4*FEET
SPACING_GROW = 0.002
CENTER_RADIUS = CENTER_DIAMETER/2
IP = "192.168.0.60"
GOLDEN_RATIO = 1.61803398875

basesLeftToAdd = NUM_BASES
basesAdded = 0
radius = CENTER_RADIUS
angle_offset = 0
ring = 0
last_ring = False
outputPolarFile = None

universe = 0
start = 0
startChannel = 1
remainingFreeChannels = 512
CHANNELS_PER_POINT = int(3) # 3 channels per point = RGB
CHANNELS_PER_BASE = int(POINTS_PER_BASE * CHANNELS_PER_POINT) 
BASES_PER_UNIVERSE = int(512 / CHANNELS_PER_BASE) 

outputs = []

for arg in sys.argv:
  if arg in ("-o"):
    outputPolarFile=open('polarCoordinates.txt','w')

for i in range(NUM_BASES):
  angle = i * (2 * math.pi) / (GOLDEN_RATIO * GOLDEN_RATIO)
  radius = (SPACING_START * ((SPACING_GROW * i) + 1) * math.sqrt(i)) + CENTER_RADIUS      
  x = radius * math.cos(angle)
  z = radius*math.sin(angle)
  tags = ["area"]


  # do we have space in the current universe?
  if (remainingFreeChannels < CHANNELS_PER_BASE):
    # output the current universe
    points = int((512-remainingFreeChannels)/CHANNELS_PER_POINT)
    output = Protocol(IP, universe, start, points)
    outputs.append (output)
    # and bump to the next universe
    universe = universe + 1
    start = start + points
    startChannel = 1
    remainingFreeChannels = 512

  # output the polar field setup file
  if outputPolarFile:
    outputPolarFile.write("baseId:"+str(basesAdded+1)+",ring:"+str(ring)+",section:"+str(k)+",angle:"+str(round(math.degrees(angle))%360)+",radius:"+str(math.floor(radius/12))+"'"+str(math.floor(radius%12))+"\""+"\n")

  # use these channels
  remainingFreeChannels = remainingFreeChannels-CHANNELS_PER_BASE
  startChannel = startChannel+CHANNELS_PER_BASE

  # add the base
  base = BaseFixture(x=x, z=z, tags=tags)
  bases.append (base)
  basesAdded = basesAdded+1

# add the final universe
if remainingFreeChannels < 512:
  # output the current universe
  points = int((512-remainingFreeChannels)/CHANNELS_PER_POINT)
  output = Protocol(IP, universe, start, points)
  outputs.append (output)
  # and bump to the next universe
  universe = universe + 1
  start = start + points
  remainingFreeChannels = 512

strComment = "Num Bases " + str(basesAdded) + "; Radius = " + str(radius / FEET);
spiral = Fixture(label="Sunflower", comment=strComment, children=bases, outputs=outputs)
json_data = json.dumps(spiral, default=lambda o:o.__dict__, indent=4)
print(json_data)
if outputPolarFile:
  outputPolarFile.close()
  outputPolarFile = None