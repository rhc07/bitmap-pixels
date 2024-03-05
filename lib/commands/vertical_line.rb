module Commands
  class VerticalLine
    def run(bitmap, x, y1, y2, colour)
      x_converted = x.to_i
      y1_converted = y1.to_i
      y2_converted = y2.to_i

      if bitmap.nil?
        puts "There is no image"
      elsif !bitmap.valid_coordinates?(x_converted, y1_converted)
        puts "Invalid coordinates: (#{x}, #{y1}), bitmap size: (#{bitmap.num_columns}, #{bitmap.num_rows})"
      elsif !bitmap.valid_coordinates?(x_converted, y2_converted)
        puts "Invalid coordinates: (#{x}, #{y2}), bitmap size: (#{bitmap.num_columns}, #{bitmap.num_rows})"
      elsif y1_converted > y2_converted
        puts "Invalid coordinates: Y2 should be bigger than Y1 y1=#{y1}, y2=#{y2}"
      elsif !bitmap.valid_colour?(colour)
        puts "Invalid colour: #{colour} only single uppercase characters are allowed"
      else
        bitmap.draw_vertical_line(x_converted, y1_converted, y2_converted, colour)
      end
    end
  end
end
