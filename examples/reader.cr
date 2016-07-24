#!/usr/bin/env crystal
require "../src/gpx"

filename = File.join(File.dirname(__FILE__), "example.gpx")

gpx = GPX.from_file(filename)

puts "GPX version: #{gpx.version}"
puts "Tracks count: #{gpx.tracks.size}"
gpx.tracks.each_with_index do |track, i|
  puts "Track ##{i}"
  puts "  Name: #{track.name}"
  start_point = track.segments[0].points[0]
  puts "  Start point: lat #{start_point.lat}, lon #{start_point.lon}"
end
