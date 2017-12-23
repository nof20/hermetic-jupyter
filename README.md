# hermetic-jupyter

Tired of your Anaconda installation getting messed up all the time?  Me too!

Build this container locally using Docker:

```
docker build -t hermetic-jupyter .
```

Then run, mapping the port, and wherever you store your Jupyter notebooks:

```
docker run -d -p 8888:8888 --mount type=bind,source=/Users/nick/Dev,target=/Users/nick/Dev hermetic-jupyter
```

Get the URL to open in your browser:

```
docker logs `docker ps | perl -lane "/.*hermetic-python.*tcp\W+(.*)$/ && print $+;"` 2>&1 | egrep "^\W+http"
```

To shut down the container:

```
docker kill `docker ps | perl -lane "/.*hermetic-jupyter.*tcp\W+(.*)$/ && print $+;"`
```
