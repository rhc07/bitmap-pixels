# frozen_string_literal: true

require './lib/error_messages.rb'

module Commands
  class HorizontalLine
    def run(bitmap, x1, x2, y, colour)
      x1_converted = x1.to_i
      x2_converted = x2.to_i
      y_converted = y.to_i

      return ErrorMessages.bitmap_not_found if bitmap.nil?

      if !bitmap.valid_coordinates?(x1_converted, y_converted)
        return ErrorMessages.invalid_coordinates(bitmap, x1, y)
      elsif !bitmap.valid_coordinates?(x2_converted, y_converted)
        return ErrorMessages.invalid_coordinates(bitmap, x2, y)
      elsif x1_converted > x2_converted
        return ErrorMessages.incorrect_size(x1, x2)
      elsif !bitmap.valid_colour?(colour)
        return ErrorMessages.invalid_colour(colour)
      else
        bitmap.draw_horizontal_line(x1_converted, x2_converted, y_converted, colour)
      end
    end
  end
end
