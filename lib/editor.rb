require_relative "bitmap"
Dir[File.join(__dir__, "commands", "*.rb")].each { |file| require file }

class Editor
  MAX_SIZE = 250

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exist?(file)

    execute_commands(File.open(file))
  end

  def execute_commands(command_list)
    bitmap = nil

    command_list.each do |line|
      command, *arguments = line.split " "
      case command
      when "S"
        # S - Shows the contents of the current image.
        Commands::Show.new.run(bitmap)
      when "I"
        # I M N - Initialises a new image, with M columns and N rows, and all pixels set to 'O'
        columns, rows = arguments

        bitmap = initialize_bitmap(columns, rows)
      when "L"
        # L X Y C - Colours the pixel (X,Y) with colour C.
        x, y, colour = arguments

        Commands::DrawPixel.new.run(bitmap, x, y, colour)
      when "V"
        # V X Y1 Y2 C - Draws a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
        x, y1, y2, colour = arguments

        Commands::VerticalLine.new.run(bitmap, x, y1, y2, colour)
      when "H"
        # H X1 X2 Y C - Draws a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
        x1, x2, y, colour = arguments

        Commands::HorizontalLine.new.run(bitmap, x1, x2, y, colour)
      when "C"
        # C - Clears the colours, resetting all pixels back to 'O'.
        if bitmap.nil?
          puts "There is no image"
        else
          bitmap = initialize_bitmap(bitmap.num_columns, bitmap.num_rows)
        end
      else
        puts "Unrecognised command :("
      end
    end
  end

  private

  def initialize_bitmap(columns, rows)
    if invalid_dimension?(columns) || invalid_dimension?(rows)
      puts "Invalid dimensions (#{columns}, #{rows}), maximum dimension size is #{MAX_SIZE}"
    end

    return if invalid_dimension?(columns) || invalid_dimension?(rows)

    Bitmap.new(columns.to_i, rows.to_i)
  end

  def invalid_dimension?(value)
    !(1...MAX_SIZE).cover? value.to_i
  end
end
