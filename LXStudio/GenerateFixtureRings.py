from typing import List
import json
import math

class BaseFixture(object):
  def __init__(self, x:int, z:int, tags:str, modelKeys:str ):
    self.type = "7-pixel-base"
    self.x = x
    self.z = z
    self.tags = tags
    self.modelKeys = modelKeys

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
NUM_BASES = 200
POINTS_PER_BASE = 7
CENTER_DIAMETER = 41*FEET
BASE_SPACING = 8*FEET
CENTER_RADIUS = CENTER_DIAMETER/2
IP = "192.168.0.60"
AISLE_CURVE = 10 / 360 * 2 * math.pi    #how many degress to offset each ring from the previous; this will create the aisle curving
NUM_AISLES = 2
AISLE_WIDTH = 24*FEET
EYE_CENTER_X = -10 * FEET
EYE_CENTER_Z = 45 * FEET
EYE_SIZE = 14*FEET

i = 0
numbases = NUM_BASES
radius = CENTER_RADIUS
angle_offset = 0
ring = 0
last_ring = False

while numbases > 0:
    perimeter = math.pi * 2 * radius
    angle = angle_offset
    ring_bases = int(((perimeter / NUM_AISLES) - AISLE_WIDTH) / BASE_SPACING)
    if (numbases <= (NUM_AISLES*ring_bases)):
      last_ring = True

    for k in range(NUM_AISLES):
        angle += AISLE_WIDTH  / perimeter * 2 * math.pi
        base_angle = ((perimeter / NUM_AISLES) - AISLE_WIDTH) / perimeter * 2 * math.pi / ring_bases
        for j in range(ring_bases):
            if (j==0 or j==(ring_bases-1)):     # figure out if light is on an edge (inner circle, outer circle, start or end of a run between aisles)
              tags = ["path","edge"]
            elif (ring == 0):
              tags = ["inner","edge"]
            elif (last_ring):
              tags = ["outer","edge"]
            else:
              tags = ["area"]
            
            x = radius * math.cos(angle)
            z = radius*math.sin(angle)

            if (k==0):
              if (math.sqrt((x-EYE_CENTER_X)*(x-EYE_CENTER_X) + (z-EYE_CENTER_Z)*(z-EYE_CENTER_Z)) >= EYE_SIZE):
                tags.append("yinyang")
            else:
              if (math.sqrt((x+EYE_CENTER_X)*(x+EYE_CENTER_X) + (z+EYE_CENTER_Z)*(z+EYE_CENTER_Z)) < EYE_SIZE or j==0 or j==(ring_bases-1) or ring==0 or last_ring):
                tags.append("yinyang")

            tags.append("section"+str(k));
            base = BaseFixture(x=x, z=z, tags=tags, modelKeys=tags)
            bases.append (base)
            numbases = numbases-1
            i = i + 1
            angle = angle + base_angle

    radius = radius + BASE_SPACING
    angle_offset = angle_offset + AISLE_CURVE
    ring = ring + 1

numpoints = i * POINTS_PER_BASE
universe = 0
start = 0
BASES_PER_UNIVERSE = int(512 / (POINTS_PER_BASE * 3)) # 3 channels per point = RGB

outputs = []
while numpoints > 0:
  points = min(numpoints,BASES_PER_UNIVERSE * POINTS_PER_BASE)
  output = Protocol(IP, universe, start, points)
  universe = universe + 1
  numpoints = numpoints - points
  start = start + points
  outputs.append (output)

spiral = Fixture(label="Rings", comment="Num Bases " + str(i), children=bases, outputs=outputs)
json_data = json.dumps(spiral, default=lambda o:o.__dict__, indent=4)
print(json_data)