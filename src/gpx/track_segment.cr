module GPX
  class TrackSegment
    getter :points

    def initialize
      @points = [] of TrackPoint
    end
  end
end
