FROM python:3.10.12
RUN apt-get update && apt-get install -y wget xz-utils libgl-dev libxi-dev libxrender-dev libxkbcommon-x11-0 &&\
    pip install -U pip wheel setuptools && pip install numpy requests &&\
    wget -q https://download.blender.org/release/Blender3.6/blender-3.6.0-linux-x64.tar.xz &&\
    tar -xf blender-3.6.0-linux-x64.tar.xz &&\
    rm blender-3.6.0-linux-x64.tar.xz &&\
    mv blender-3.6.0-linux-x64 blender &&\
    rm -rf /blender/3.6/python &&\
    echo '#!/bin/sh\n/blender/blender -noaudio -b --python-use-system-env $@' > /usr/bin/blender &&\
    chmod +x /usr/bin/blender
CMD blender --python-console
