# frozen_string_literal: true

module Commands
  class HorizontalLine
    def run(bitmap, x1, x2, y, colour)
      x1_converted = x1.to_i
      x2_converted = x2.to_i
      y_converted = y.to_i

      if bitmap.nil?
        puts 'There is no image'
      elsif !bitmap.valid_coordinates?(x1_converted, y_converted)
        puts "Invalid coordinates: (#{x1}, #{y}), bitmap size: (#{bitmap.num_columns}, #{bitmap.num_rows})"
      elsif !bitmap.valid_coordinates?(x2_converted, y_converted)
        puts "Invalid coordinates: (#{x2}, #{y}), bitmap size: (#{bitmap.num_columns}, #{bitmap.num_rows})"
      elsif x1_converted > x2_converted
        puts "Invalid coordinates: X2 should be bigger than X1 x1=#{x1}, x2=#{x2}"
      elsif !bitmap.valid_colour?(colour)
        puts "Invalid colour: #{colour} only single uppercase characters are allowed"
      else
        bitmap.draw_horizontal_line(x1_converted, x2_converted, y_converted, colour)
      end
    end
  end
end
