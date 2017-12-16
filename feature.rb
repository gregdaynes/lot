class Feature
  def self.type
    ancestors[1]
  end
end

class Shape < Feature; end
class Triangle < Shape; end
class Square < Shape; end
class Circle < Shape; end

class Color < Feature; end
class Red < Color; end
class Green < Color; end
class Blue < Color; end

class Fill < Feature; end
class Empty < Fill; end
class Halftone < Fill; end
class Solid < Fill; end
