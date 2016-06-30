module GPX
  class TrackPoint
    property :lat, :lon

    def initialize(@lat : Float64, @lon : Float64)
    end
  end
end
