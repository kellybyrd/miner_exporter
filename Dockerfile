FROM python:3-buster
ENV PYTHONUNBUFFERED=1

#RUN apt update && apt install -y vim
COPY requirements.txt /opt/app/
RUN pip3 install -r /opt/app/requirements.txt

# copying the py later than the reqs so we don't need to rebuild as often
COPY *py /opt/app/
CMD /opt/app/miner_exporter.py