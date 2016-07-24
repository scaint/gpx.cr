module GPX
  class TrackPoint
    @ele : Float32 | Nil

    property :lat, :lon, :ele

    def initialize(@lat : Float64, @lon : Float64)
    end
  end
end
