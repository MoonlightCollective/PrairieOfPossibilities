from typing import List
import json
import math

class BaseFixture(object):
  def __init__(self, x:int, z:int):
    self.type = "7-pixel-base"
    self.x = x
    self.z = z

class Fixture(object):
  def __init__(self, label:str, children:List[BaseFixture]):
    self.label = label
    self.children = children

bases = []

FEET = 304 #304 mm in a foot
NUM_BASES = 200
CENTER_DIAMETER = 30*FEET
BASE_SPACING = 8*FEET
CENTER_RADIUS = CENTER_DIAMETER/2

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
  
spiral = Fixture(label="Light Spiral", children=bases)
json_data = json.dumps(spiral, default=lambda o:o.__dict__, indent=4)
print(json_data)