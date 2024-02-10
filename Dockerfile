FROM python:3.10.9-slim-bullseye

RUN apt-get update && apt-get install -y make ffmpeg libsm6 libxext6 && apt-get clean

WORKDIR /app

COPY ./ /app

RUN make install_virtualenv

RUN make venv

RUN make env_activate

RUN make install

CMD ["make", "run"]