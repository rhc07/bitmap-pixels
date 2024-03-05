# frozen_string_literal: true

module Commands
  class Show
    def run(bitmap)

      return ErrorMessages.bitmap_not_found if bitmap.nil?

      puts bitmap

    end
  end
end
