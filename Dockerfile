FROM ubuntu:artful

RUN apt-get update

RUN apt-get -y install python2.7 python-pip

RUN apt-get -y install jupyter-notebook

COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt

EXPOSE 8888

CMD [ "jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]
