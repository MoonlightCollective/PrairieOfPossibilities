


docker run -d -it --name audio-pipelines  --mount type=bind,source=/ContainerData,target=/ContainerData  python:3.8-bookworm
docker exec -it audio-pipelines bash


docker pull python:3.8-bookworm
pip install --upgrade pip
pip install https://github.com/pyannote/pyannote-audio/archive/refs/heads/develop.zip

