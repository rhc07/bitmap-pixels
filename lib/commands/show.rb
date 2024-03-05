# frozen_string_literal: true

module Commands
  class Show
    def run(bitmap)
      if bitmap.nil?
        puts 'There is no image'
      else
        puts bitmap
      end
    end
  end
end
