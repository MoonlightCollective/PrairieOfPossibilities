


docker run -d -it --name audio-pipelines  --mount type=bind,source=/ContainerData,target=/ContainerData  continuumio/miniconda3
docker exec -it audio-pipelines bash


docker pull python:3.8-bookworm
pip install --upgrade pip
pip install https://github.com/pyannote/pyannote-audio/archive/refs/heads/develop.zip
 pip install pydub


// common and needed for stage1
conda create -n pyannote python=3.8
conda activate pyannote
conda install pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 -c pytorch
pip install pyannote.audio
apt update
apt install build-essential
apt-get install libsndfile-dev
pip install pydub

// needed for stage2
pip install transformers
pip install xformers


