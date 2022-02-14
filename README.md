# gpxlogger-docker

gpxlogger is a tool that connects with gpsd and writes the received positions in a file in GPX format.

This docker image starts gpxlogger periodically, runs it for 5 minutes and saves its output in a files called `track-<date>.gpx`. 

Running the gpxlogger in cycles ensures gpx files integrity in case the system is stopped ungracefully (e.g. due to power cut).

Run it as follows:
```bash
mkdir /my-output-dir
docker run -v /my-output-dir:/out ci4rail/gpxlogger <host>:2947
```

When the container runs on the same device as gpsd, specify the docker host ip as `host`, e.g. `172.17.0.1`

See [man page](https://gpsd.gitlab.io/gpsd/gpxlogger.html) for details.