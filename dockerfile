FROM python:3.14.10-trixie

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN python -m pip install --no-cache-dir --upgrade pip \
    && python -m pip install --no-cache-dir \
        robotframework \
        robotframework-seleniumlibrary \
        RESTinstance \
        robotframework-doctestlibrary \
        pika

VOLUME /tests
VOLUME /output

ENTRYPOINT ["robot"]
CMD ["--outputdir", "/output", "/tests"]
