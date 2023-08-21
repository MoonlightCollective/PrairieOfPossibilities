#!/bin/zsh
cp /Users/moonlight/Documents/GitHub/PraireOfPossibilities/AudioPipeline/stage2.py /Users/moonlight/Documents/ContainerData/stage2.py
cd /Users/moonlight/Documents/ContainerData/
while true
do
  conda run --live-stream -n pyannote python ./stage2.py
  echo "restarting stage2"
done

#conda activate pyannote
#python stage1.py

#on run {input, parameters}
#	tell application "Terminal" to activate
#	tell application "System Events" to keystroke "t" using {command down}
#	tell application "Terminal" to do script "/Users/moonlight/Documents/ContainerData/stage2.sh" in front window#
#	return input
#end run