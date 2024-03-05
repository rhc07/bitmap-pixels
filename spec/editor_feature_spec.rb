# frozen_string_literal: true

require 'spec_helper'
require 'editor'

RSpec.describe Editor do
  subject(:editor) { described_class.new }

  describe '#run' do
    it 'can output empty state' do
      expect { editor.run('examples/01_show.txt') }.to output("There is no image\n").to_stdout
    end

    it 'can output grid' do
      expect { editor.run('examples/02_initialise.txt') }.to output("OOOO\nOOOO\nOOOO\n").to_stdout
    end

    it 'can colour a pixel' do
      expect { editor.run('examples/03_draw_pixel.txt') }.to output("OOOO\nOOOO\nOAOO\nOOOO\nOOOO\n").to_stdout
    end

    it 'can draw an horizontal line' do
      expect { editor.run('examples/04_horizontal_line.txt') }.to output("OOOO\nOOZZ\nOOOO\nOOOO\nOOOO\n").to_stdout
    end

    it 'can draw a vertical line' do
      expect { editor.run('examples/05_vertical_line.txt') }.to output("OOOO\nOOOK\nOOOK\nOOOK\nOOOO\n").to_stdout
    end

    it 'can clear the bitmap' do
      expect { editor.run('examples/06_clear.txt') }.to output("OOOO\nOOOO\nOOOO\nOOOO\n").to_stdout
    end
  end
end
