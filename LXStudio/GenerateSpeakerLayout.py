from typing import List
import json
import math

class BaseFixture(object):
  def __init__(self, x:int, z:int):
    self.type = "7-pixel-base"
    self.x = x
    self.z = z

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
NUM_BASES = 10
POINTS_PER_BASE = 7
CENTER_DIAMETER = 42*FEET
BASE_SPACING = 30*FEET
CENTER_RADIUS = CENTER_DIAMETER/2
IP = "192.168.0.60"
AISLE_CURVE = 10 / 360 * 2 * math.pi    #how many degress to offset each ring from the previous; this will create the aisle curving
NUM_AISLES = 2
AISLE_WIDTH = 16*FEET

i = 0
numbases = NUM_BASES
radius = CENTER_RADIUS
angle_offset = 5 / 360 * 2 * math.pi
ring = 0

while numbases > 0:
    perimeter = math.pi * 2 * radius
    angle = angle_offset

    for k in range(NUM_AISLES):
        angle += AISLE_WIDTH  / perimeter * 2 * math.pi
        ring_bases = int(((perimeter / NUM_AISLES) - AISLE_WIDTH) / BASE_SPACING)
        base_angle = ((perimeter / NUM_AISLES) - AISLE_WIDTH) / perimeter * 2 * math.pi / ring_bases

        for j in range(ring_bases):
            base = BaseFixture(x=radius * math.cos(angle), z=radius*math.sin(angle))
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

spiral = Fixture(label="Speakers", comment="Num Speakers " + str(i), children=bases, outputs=outputs)
json_data = json.dumps(spiral, default=lambda o:o.__dict__, indent=4)
print(json_data)