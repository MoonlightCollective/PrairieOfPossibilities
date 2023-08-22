from typing import List
import sys, getopt
import json
import math

class BaseFixture(object):
  def __init__(self, id:int, x:int, z:int ):
    self.id = id
    self.x = x
    self.z = z

class Fixture(object):
  def __init__(self, FixtureId:int, PathId:int ):
    self.FixtureType = "PlantFixture"
    self.FixtureId = FixtureId
    self.PathId = PathId
    self.ChannelStartOverride = -1

class Path(object):
  def __init__(self, pathId:int, artnetHost:str, universe:int, channelStart:int, items:List[Fixture] ):
    self.pathId = pathId
    self.artnetHost = artnetHost
    self.universe = universe
    self.channelStart = channelStart
    self.items = items

class FixtureFile(object):
  def __init__(self, label:str, comment:str, children:List[BaseFixture], wirePaths:List[Path] ):
    self.label = label
    self.comment = comment
    self.children = children
    self.outputs = []
    self.wirePaths = wirePaths

bases = []
paths = []

# 8 dmx controllers
# 4 universes per controller
# 24 bases per universe

newid = 0
pathId = 0

for d in range(10):
  for u in range(4):
    fixtures = []
    idInPath = 0
    for i in range(24):
      base = BaseFixture(id=newid, x=(d*36), z=((u*24)+i)*36)
      bases.append (base)
      fixture = Fixture(newid, idInPath)
      fixtures.append (fixture)
      idInPath += 1
      newid += 1

    # now create a new path for these 24 bases
    newip = 220 + d
    hostname = "192.168.0." + str(newip)
    newpath = Path(pathId, hostname, u+1, 1, fixtures)
    paths.append (newpath)
    pathId += 1

file = FixtureFile ("Test Layout", "Testing all dimmers", bases, paths)
json_data = json.dumps(file, default=lambda o:o.__dict__, indent=4)
print(json_data)