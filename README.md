# gpxlogger-docker

gpxlogger is a tool that connects with gpsd and writes the received positions in a file in GPX format.

This docker image starts gpxlogger periodically, runs it for 5 minutes and saves its output in a files called `track-<date>.gpx`. 

Running the gpxlogger in cycles ensures gpx files integrity in case the system is stopped ungracefully (e.g. due to power cut).

Run it as follows:
```bash
mkdir /my-output-dir
docker run -v /my-output-dir:/out gpxlogger_loc 192.168.24.11:2947
```

See [man page](https://gpsd.gitlab.io/gpsd/gpxlogger.html) for details.