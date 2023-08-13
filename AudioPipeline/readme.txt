


docker run -d -it --name audio-pipelines  --mount type=bind,source=/ContainerData,target=/ContainerData  continuumio/miniconda3
docker run -d -it --name audio-pipelines  --mount type=bind,source=/Users/moonlight/Documents/ContainerData,target=/ContainerData  continuumio/miniconda3 

// docker pull python:3.8-bookworm

docker exec -it audio-pipelines bash
// conda install -c conda-forge gcc
// pip install --upgrade pip
// pip install https://github.com/pyannote/pyannote-audio/archive/refs/heads/develop.zip
// pip install pydub
//conda install pytorch torchvision -c pytorch
// or pip3 install torch torchvision torchaudio
//confirm with: 
//conda search --info -c pytorch torchaudio

// common and needed for stage1
conda create -n pyannote python=3.8
conda activate pyannote

// for mac
conda install pytorch==1.12.0 torchvision==0.13.0 torchaudio==0.12.0 -c pytorch
conda install -c conda-forge hmmlearn=0.2.8

pip install soundfile?
libsndfile
cp /opt/homebrew/lib/libsndfile.dylib /Users/moonlight/miniconda3/envs/pyannote/lib/python3.8/site-packages/_soundfile_data/
conda install scipy

//for windows 
conda install pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 -c pytorch

// for both
pip install pyannote.audio




// windows only?
apt update
apt install build-essential
apt-get install libsndfile-dev
//

pip install pydub

// needed for stage2
pip install transformers

// conda install -c conda-forge cxx-compiler
pip install xformers



// docker run --hostname=6448153b9438 --mac-address=02:42:ac:11:00:02 --env=PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --restart=no --runtime=runc -t -d conda/miniconda3

// docker run --hostname=3b2fb2b2e1c1 --mac-address=02:42:ac:11:00:02 --env=PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=LANG=C.UTF-8 --env=LC_ALL=C.UTF-8 --restart=no --label='maintainer=Anaconda, Inc' --label='org.opencontainers.image.created=2023-05-02T19:14:07.639Z' --label='org.opencontainers.image.description=Repository of Docker images created by Anaconda' --label='org.opencontainers.image.licenses=' --label='org.opencontainers.image.revision=60eb8fe8f841c7d64a2439920562edc8e409c80f' --label='org.opencontainers.image.source=https://github.com/ContinuumIO/docker-images' --label='org.opencontainers.image.title=docker-images' --label='org.opencontainers.image.url=https://github.com/ContinuumIO/docker-images' --label='org.opencontainers.image.version=23.3.1-0' --runtime=runc -t -d continuumio/miniconda3