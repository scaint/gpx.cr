require "./spec_helper"

describe GPX do
  describe ".from_file" do
    document = GPX.from_file("spec/files/test.gpx")

    it "should read version" do
      document.version.should eq("1.0")
    end

    it "should read document name" do
      document.name.should eq("Example gpx")
    end

    context "track" do
      it "should read tracks" do
        document.tracks.size.should eq(1)
      end

      it "should read track name" do
        track = document.tracks[0]
        track.name.should eq("Example track")
      end

      context "segment" do
        track = document.tracks[0]

        it "should read track segments" do
          track.segments.size.should eq(1)
        end

        context "point" do
          segment = document.tracks[0].segments[0]

          it "should read points" do
            segment.points.size.should eq(7)
          end

          it "should read point latitude and longitude" do
            point = segment.points[0]
            point.lat.should eq 46.57608333
            point.lon.should eq 8.89241667
          end

          it "should read point elevation" do
            segment.points[0].ele.should eq 2376.5
            segment.points[1].ele.should eq nil
          end
        end
      end
    end
  end
end
