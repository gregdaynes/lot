require 'pastel'
require 'tty-table'

module Output
  class Card
    def call(card)
      @shape = card.shape
      @fill = card.fill
      @color = card.color
      @count = card.count


      #@symbol = build_symbol(shape, fill)
      #@count = count

      colorize(build_count(build_symbol))
    end

    private

    def build_symbol
      symbols = {
        Square: { Empty: '□', Halftone: '◨', Solid: '■' },
        Circle: { Empty: '○', Halftone: '◍', Solid: '●' },
        Triangle: { Empty: '△', Halftone: '◭', Solid: '▲' }
      }

      shape = @shape.to_s.intern
      fill = @fill.to_s.intern

      symbols[shape][fill]
    end

    def build_count(string)
      case @count
      when 1
        " #{string} "
      when 2
        " #{string * 2}"
      when 3
        "#{string * 3}"
      end
    end

    def colorize(string)
      pastel = Pastel.new

      color = @color.to_s.downcase.intern

      pastel.public_send(color, string)
    end
  end

  class Field
    def call(arr)
      card_groups = arr.each_slice(4).to_a
      TTY::Table.new(card_groups)
    end
  end
end
