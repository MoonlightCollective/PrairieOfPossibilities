


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



docker run --hostname=6448153b9438 --mac-address=02:42:ac:11:00:02 --env=PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --restart=no --runtime=runc -t -d conda/miniconda3

docker run --hostname=3b2fb2b2e1c1 --mac-address=02:42:ac:11:00:02 --env=PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=LANG=C.UTF-8 --env=LC_ALL=C.UTF-8 --restart=no --label='maintainer=Anaconda, Inc' --label='org.opencontainers.image.created=2023-05-02T19:14:07.639Z' --label='org.opencontainers.image.description=Repository of Docker images created by Anaconda' --label='org.opencontainers.image.licenses=' --label='org.opencontainers.image.revision=60eb8fe8f841c7d64a2439920562edc8e409c80f' --label='org.opencontainers.image.source=https://github.com/ContinuumIO/docker-images' --label='org.opencontainers.image.title=docker-images' --label='org.opencontainers.image.url=https://github.com/ContinuumIO/docker-images' --label='org.opencontainers.image.version=23.3.1-0' --runtime=runc -t -d continuumio/miniconda3