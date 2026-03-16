FROM python:3

RUN apt-get -y update && apt-get -y install libxml2-dev
RUN apt-get -y upgrade

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install robotframework
RUN pip install robotframework-selenium2library
RUN pip install RESTinstance
RUN /usr/local/bin/python -m pip install robotframework-doctestlibrary
RUN pip install --force-reinstall -v "jsonpath_ng==1.7.0"

VOLUME /tests
VOLUME /output

ENTRYPOINT ["robot"]
CMD ["--outputdir", "/output", "/tests"]
