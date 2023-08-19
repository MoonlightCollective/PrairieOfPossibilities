#!/bin/zsh
cp /Users/moonlight/Documents/GitHub/PraireOfPossibilities/AudioPipeline/stage1.py /Users/moonlight/Documents/ContainerData/stage1.py
cd /Users/moonlight/Documents/ContainerData/
conda run --live-stream -n pyannote python ./stage1.py
#conda activate pyannote
#python stage1.py



#on run {input, parameters}
#	tell application "Terminal" to activate
#	tell application "System Events" to keystroke "t" using {command down}
#	tell application "Terminal" to do script "/Users/moonlight/Documents/ContainerData/stage1.sh" in front window#
#	return input
#end run