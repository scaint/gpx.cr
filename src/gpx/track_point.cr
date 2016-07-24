module GPX
  class TrackPoint
    @ele : Float32 | Nil
    @time : Time | Nil

    property :lat, :lon, :ele, :time

    def initialize(@lat : Float64, @lon : Float64)
    end
  end
end
