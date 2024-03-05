# frozen_string_literal: true

module ErrorMessages
  def self.bitmap_not_found
    puts 'There is no image'
  end

  def self.invalid_coordinates(bitmap, column, row)
    puts "Invalid coordinates: (#{column}, #{row}), bitmap size: (#{bitmap.num_columns}, #{bitmap.num_rows})"
  end

  def self.incorrect_size(coordinate_one, coordinate_two)
    puts "Invalid coordinates: X2 should be bigger than X1 x1=#{coordinate_one}, x2=#{coordinate_two}"
  end

  def self.invalid_colour(colour)
    puts "Invalid colour: #{colour} only single uppercase characters are allowed"
  end
end
