FROM python:3.9.2
RUN apt-get update && apt-get install -y wget xz-utils libgl-dev libxi-dev libxrender-dev
RUN wget -q https://download.blender.org/release/Blender2.93/blender-2.93.5-linux-x64.tar.xz &&\
    tar -xf blender-2.93.5-linux-x64.tar.xz &&\
    rm blender-2.93.5-linux-x64.tar.xz &&\
    mv blender-2.93.5-linux-x64 blender &&\
    rm -rf /blender/2.93/python &&\
    echo '/blender/blender -noaudio -b --python-use-system-env $@' > /usr/bin/blender &&\
    chmod +x /usr/bin/blender
RUN pip install -U pip wheel setuptools && pip install numpy requests
CMD blender --python-console
