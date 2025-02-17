FROM ubuntu:20.04
USER root

VOLUME /src

RUN apt update

# install python and pip
RUN apt install -y python3.9 
RUN apt install -y python3-pip
RUN pip install --upgrade pip

COPY requirements.txt .
RUN python3.9 -m pip install -r requirements.txt

# タイムゾーン
ENV TZ=Asia/Tokyo \
    # Locale
    LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8

# apt
RUN apt install -y libopencv-dev


# set working directory and copy files
WORKDIR /home

# install opencv
RUN pip install opencv-python
