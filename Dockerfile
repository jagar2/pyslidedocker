FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive
ARG PYSIDE2_VERSION=6.6.1

ENV TZ=Europe/Paris

# Install necessary packages
RUN apt-get update && apt-get -y install \
    make git python3-pip qml-module-qtquick-controls2 \
    qml-module-qtmultimedia qml-module-qtgraphicaleffects \
    qml-module-qtquick2 xvfb xdotool wmctrl libxcb-cursor0 \
    libxkbcommon-x11-0 libx11-xcb1 libfontconfig1 libgl1-mesa-glx \
    tzdata

# Install PySide6
RUN python3 -m pip install PySide6==$PYSIDE2_VERSION

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy hello.py into the container
COPY hello.py /app/hello.py

# Set the working directory
WORKDIR /app

# Run the application
ENTRYPOINT ["python3", "/app/hello.py"]
