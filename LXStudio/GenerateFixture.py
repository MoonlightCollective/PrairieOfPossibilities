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
  def __init__(self, label:str, children:List[BaseFixture], outputs:List[Protocol]):
    self.label = label
    self.children = children
    self.outputs = outputs

bases = []

FEET = 304 #304 mm in a foot
NUM_BASES = 200
POINTS_PER_BASE = 7
CENTER_DIAMETER = 30*FEET
BASE_SPACING = 8*FEET
CENTER_RADIUS = CENTER_DIAMETER/2
IP = "192.168.0.60"

i = 0
numbases = NUM_BASES
radius = CENTER_RADIUS
angle = 0

while numbases > 0:
  perimeter = math.pi * 2 * radius
  ring_bases = int(perimeter / BASE_SPACING)
  radius_add = BASE_SPACING/ring_bases
  skip = False
  for j in range(20):
    if i==j*(11+(3*j)) or i == 3 + j*(13+(3*j)) or i == 6 + j*(14+(3*j)) or i == 10 + j*(16+(3*j)):
      skip = True
      break

  if not(skip):
    base = BaseFixture(x=radius * math.cos(angle), z=radius*math.sin(angle))
    bases.append (base)
    numbases = numbases-1

  angle = angle + math.pi * 2 / ring_bases
  radius = radius + radius_add
  i = i +1

numpoints = NUM_BASES * POINTS_PER_BASE
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

spiral = Fixture(label="Light Spiral", children=bases, outputs=outputs)
json_data = json.dumps(spiral, default=lambda o:o.__dict__, indent=4)
print(json_data)