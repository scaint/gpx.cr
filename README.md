# gpx [![Build Status](https://travis-ci.org/scaint/gpx.cr.svg?branch=master)](https://travis-ci.org/scaint/gpx.cr) [![crystal-docs.org](https://crystal-docs.org/badge.svg)](https://crystal-docs.org/scaint/gpx.cr)

GPX (the GPS Exchange Format) parser for Crystal

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  gpx:
    github: scaint/gpx.cr
```


## Usage


```crystal
require "gpx"

gpx = GPX.from_file("example.gpx")

track = gpx.tracks[0]
puts track.name

start_point = track.segments[0].points[0]
puts start_point.lat
puts start_point.lon
puts start_point.ele
puts start_point.time
```

## TODO

- [ ] Bounds
- [ ] Haversine distance
- [ ] Track optimization
