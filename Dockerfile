FROM python:3.8-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN cd /
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /revive_autoheaven
WORKDIR /revive_autoheaven
COPY start.sh /start.sh
cd /revive_autoheaven
pip3 install -U -r requirements.txt
CMD gunicorn app:app & python3 bot.py
