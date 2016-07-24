require "./gpx/*"
require "xml"

module GPX
  TIME_FORMAT = "%FT%T%:z"

  def self.from_file(filename : String)
    from_xml(File.read(filename))
  end

  def self.from_xml(source : String)
    xml = XML.parse(source)
    root = xml.root
    raise "<gpx> element expected" unless root && root.name == "gpx"

    document = Document.new(root["version"])
    document.name = root.xpath_string("string(name)")

    root.xpath_nodes("trk").each do |trk|
      track = Track.new
      track.name = trk.xpath_string("string(name)")

      trk.xpath_nodes("trkseg").each do |trkseg|
        segment = TrackSegment.new

        trkseg.xpath_nodes("trkpt").each do |trkpt|
          lat = trkpt["lat"]?
          lon = trkpt["lon"]?

          raise "expected @lat attribute" unless lat
          raise "expected @lon attribute" unless lon

          point = TrackPoint.new(lat.to_f64, lon.to_f64)
          ele = trkpt.xpath_string("string(ele)")
          point.ele = ele.to_f32 unless ele.empty?

          time = trkpt.xpath_string("string(time)")
          point.time = Time.parse(time, TIME_FORMAT) unless time.empty?

          segment.points << point
        end

        track.segments << segment
      end

      document.tracks << track
    end

    document
  end
end
