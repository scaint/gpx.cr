module GPX
  class Document
    getter :version, :tracks

    property :name

    def initialize(version : (String | Nil))
      @version = version || "1.1"
      @name = ""
      @tracks = [] of Track
    end
  end
end
