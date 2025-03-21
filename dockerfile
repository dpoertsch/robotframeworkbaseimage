FROM python:3

RUN apt-get -y update && apt-get -y install libxml2-dev

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install robotframework
RUN pip install robotframework-selenium2library

VOLUME /tests
VOLUME /output

ENTRYPOINT ["robot"]
CMD ["--outputdir", "/output", "/tests"]
