import json
import sys

##
## expects a json file (see swapTest.json) to provide commands to apply
## to the processing of the fixture.  Currenly supported are "tag" and "swap"
## Example processing file to add a tag to the first fixture element and then swap 
## the first element with the second one.
# {
# 	"commands":
# 	[
# 		{
# 			"cmd":"tag",
# 			"index":0,
# 			"tag":"A"
# 		},
# 		{
# 			"cmd":"swap",
# 			"swapA":0,
# 			"swapB":1
# 		},
# 	]
# }

USAGE_STR = "USAGE: \n\processFixture <input fixture file> <process definition file> <output fixture file>"

def doTag(jData,cmdData):
	# parse command
	childDex = int(cmdData['index'])
	tag = cmdData['tag']
	print(f'Tag fixture {childDex} with {tag}')
	childParent = jData['children']
	targetObj = childParent[childDex]
	if (tag in targetObj['tags']):
		print(f'already has tag')
	else:
		targetObj['tags'].append(tag)
		print(f'Tagged')

def doSwap(jData,cmdData):
	# parse command
	fromChild = int(cmdData['swapA'])
	toChild = int(cmdData['swapB'])
	print(f'swap {fromChild} with {toChild}')

	# re-order children
	print(f'Reordering children {fromChild} and {toChild}')
	childParent = jData['children']
	tmp=childParent[fromChild]
	childParent[fromChild] = childParent[toChild]
	childParent[toChild]=tmp
	

# Main entrypoint
def main():
	# check args
	if len(sys.argv) < 4:
		print(USAGE_STR);
		sys.exit(-1)

	# parse args
	inFileName = sys.argv[1]
	processFileName = sys.argv[2]
	outFileName = sys.argv[3]

	# set up dictionary for processing commands
	commandDict = { 'tag':doTag,'swap':doSwap }

	# read input file
	print(f'Loading input file {inFileName}')
	with open (inFileName) as jFile:
		jdata = json.load(jFile)
	print(f'done reading')

	# read process file
	print('Reading process file')
	with open (processFileName) as pFile:
		processData = json.load(pFile)
	print(f'done')

	# iterate through process commands
	for cmdObj in processData['commands']:
		cmdKey = cmdObj['cmd']
		if (cmdKey in commandDict.keys()):
			commandDict[cmdKey](jdata,cmdObj)

	# write json file
	print(f'writing file {outFileName}')
	jStr = json.dumps(jdata,indent = 2)
	with open (outFileName,"w") as outFile:
		outFile.write(jStr)

if __name__ == "__main__":
    main()
