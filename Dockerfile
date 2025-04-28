FROM nvidia/cuda:12.2.2-devel-ubuntu22.04

RUN apt-get update && apt-get install -y --no-install-recommends pkg-config libglvnd-dev libgl1-mesa-dev libegl1-mesa-dev libgles2-mesa-dev
ENV TZ=US \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y python3.10 python3-pip libfontconfig1-dev libxkbcommon0 libxkbcommon-x11-0 libxkbcommon-dev libdbus-1-3 '^libxcb.*' libglx0 libopengl0 libgl1 qt5dxcb-plugin libxcb-xinerama0 libicu-dev gsl-bin libgl1-mesa-dri libglib2.0-0 libglu1-mesa-dev libglw1-mesa libgomp1 libjpeg-turbo8-dev libjpeg62 libudunits2-dev libxm4 netpbm xfonts-base xvfb && rm -rf /var/lib/apt/lists/*
RUN pip install PySide6==6.4.2 "numpy<2"
RUN pip install napari-deeplabcut

RUN useradd -ms /bin/bash napari
USER napari
SHELL ["/bin/bash", "-l", "-c"]
ENTRYPOINT ["python3", "/usr/local/lib/python3.10/dist-packages/napari"]
