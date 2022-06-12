ARG BUILD_FROM
FROM $BUILD_FROM

# Install mosquitto + PetHubLocal
RUN apk add --no-cache \
        gcc \
        linux-headers \
        libc-dev \
        git \
        python3 \
        python3-dev \
        py3-pip \
		mosquitto

# Copy rootfs
COPY rootfs /

# Clone Code Repo
WORKDIR /code
RUN git clone https://github.com/PetHubLocal/pethublocal

# Install using PIP
WORKDIR /code/pethublocal
RUN pip3 install .

# Final working directory is under share/pethublocal
WORKDIR /share/pethublocal
