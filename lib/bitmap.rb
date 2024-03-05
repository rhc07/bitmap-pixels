# frozen_string_literal: true

class Bitmap
  attr_reader :num_columns, :num_rows

  def initialize(num_columns, num_rows)
    @num_columns = num_columns
    @num_rows = num_rows

    @image = Array.new(num_rows) do
      Array.new(num_columns, 'O')
    end
  end

  def draw_pixel(x, y, colour)
    @image[y - 1][x - 1] = colour
  end

  def draw_horizontal_line(x1, x2, y, colour)
    (x1..x2).each { |x| draw_pixel(x, y, colour) }
  end

  def draw_vertical_line(x, y1, y2, colour)
    (y1..y2).each { |y| draw_pixel(x, y, colour) }
  end

  def to_s
    @image.map { |row| row.join('') }.join("\n")
  end

  def valid_coordinates?(x_coordinate, y_coordinate)
    (1..num_columns).cover?(x_coordinate) && (1..num_rows).cover?(y_coordinate)
  end

  def valid_colour?(colour)
    colour =~ /^[A-Z]$/
  end
end
