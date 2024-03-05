# frozen_string_literal: true

require 'spec_helper'
require 'bitmap'
require 'commands/vertical_line'

RSpec.describe Commands::VerticalLine do
  subject(:vertical_line) { described_class.new.run(bitmap, x, y1, y2, colour) }

  let(:x) { '2' }
  let(:y1) { '1' }
  let(:y2) { '3' }
  let(:colour) { 'X' }

  context 'when bitmap is nil' do
    let(:bitmap) { nil }

    it 'shows an error message' do
      expect { vertical_line }.to output(/There is no image/).to_stdout
    end
  end

  context 'when bitmap exists' do
    let(:bitmap) { Bitmap.new(bitmap_columns, bitmap_rows) }

    let(:bitmap_columns) { 3 }
    let(:bitmap_rows) { 3 }

    context 'when line can be drawn' do
      it 'updates the bitmap' do
        expect(bitmap).to receive(:draw_vertical_line).with(2, 1, 3, 'X')

        vertical_line
      end
    end

    context 'when y1 = y2' do
      let(:y2) { '1' }
      it 'updates the bitmap' do
        expect(bitmap).to receive(:draw_vertical_line).with(2, 1, 1, 'X')

        vertical_line
      end
    end

    context 'when y1 < y2' do
      let(:y1) { '2' }
      let(:y2) { '1' }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when x is too small' do
      let(:x) { '0' }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when x is too large' do
      let(:x) { (bitmap_columns + 1).to_s }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when x has an invalid value' do
      let(:x) { 'A' }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when y1 is too small' do
      let(:y1) { '0' }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when y1 is too large' do
      let(:y1) { (bitmap_rows + 1).to_s }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when y1 has an invalid value' do
      let(:y1) { 'A' }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when y2 is too small' do
      let(:y2) { '0' }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when y2 is too large' do
      let(:y2) { (bitmap_rows + 1).to_s }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when y2 has an invalid value' do
      let(:y2) { 'A' }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when pixel has lowercase colour' do
      let(:colour) { 'x' }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid colour/).to_stdout
      end
    end

    context 'when pixel has multi character colour' do
      let(:colour) { 'XA' }

      it 'shows an error message' do
        expect { vertical_line }.to output(/Invalid colour/).to_stdout
      end
    end
  end
end
