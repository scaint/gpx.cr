module GPX
  class Track
    getter :segments

    property :name

    def initialize
      @name = ""
      @segments = [] of TrackSegment
    end
  end
end
