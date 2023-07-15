


docker run -d -it --name audio-pipelines  --mount type=bind,source=/ContainerData,target=/ContainerData  python:3.8-bookwrom
docker exec -it audio-pipelines bash