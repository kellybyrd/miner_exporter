FROM python:3-alpine
LABEL org.opencontainers.image.source https://github.com/tedder/miner_exporter
ENV PYTHONUNBUFFERED=1
EXPOSE 9825

# install OS and Python dependencies
RUN apk update && apk add libc-dev linux-headers gcc python3-dev
COPY requirements.txt /opt/app/
RUN pip3 install -r /opt/app/requirements.txt
RUN apk del libc-dev linux-headers gcc python3-dev

# copying the py later than the reqs so we don't need to rebuild as often
COPY *py /opt/app/
CMD /opt/app/miner_exporter.py
