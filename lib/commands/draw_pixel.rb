module Commands
  class DrawPixel
    def run(bitmap, x, y, colour)
      x_converted = x.to_i
      y_converted = y.to_i

      if bitmap.nil?
        puts "There is no image"
      elsif !bitmap.valid_coordinates?(x_converted, y_converted)
        puts "Invalid coordinates: (#{x}, #{y}), bitmap size: (#{bitmap.num_columns}, #{bitmap.num_rows})"
      elsif !bitmap.valid_colour?(colour)
        puts "Invalid colour: #{colour} only single uppercase characters are allowed"
      else
        bitmap.draw_pixel(x_converted, y_converted, colour)
      end
    end
  end
end
