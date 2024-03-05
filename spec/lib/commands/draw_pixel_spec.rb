# frozen_string_literal: true

require 'spec_helper'
require 'commands/draw_pixel'

RSpec.describe Commands::DrawPixel do
  subject(:draw_pixel) { described_class.new.run(bitmap, x, y, colour) }

  let(:x) { 1 }
  let(:y) { 1 }
  let(:colour) { 'X' }

  context 'when bitmap is nil' do
    let(:bitmap) { nil }

    it 'shows an error message' do
      expect { draw_pixel }.to output(/There is no image/).to_stdout
    end
  end

  context 'when bitmap exists' do
    let(:bitmap) { Bitmap.new(bitmap_columns, bitmap_rows) }
    let(:bitmap_columns) { 3 }
    let(:bitmap_rows) { 2 }

    context 'when pixel can be drawn' do
      it 'updates the bitmap' do
        draw_pixel
        expect(bitmap.to_s).to eq("XOO\nOOO")
      end
    end

    context 'when pixel is out of bounds because X is too small' do
      let(:x) { 0 }

      it 'shows an error message' do
        expect { draw_pixel }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when pixel is out of bounds because X is too big' do
      let(:x) { 4 }

      it 'shows an error message' do
        expect { draw_pixel }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when pixel is out of bounds because Y is too small' do
      let(:y) { 0 }

      it 'shows an error message' do
        expect { draw_pixel }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when pixel is out of bounds because Y is too small' do
      let(:y) { 3 }

      it 'shows an error message' do
        expect { draw_pixel }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context 'when pixel has lowercase colour' do
      let(:colour) { 'x' }

      it 'shows an error message' do
        expect { draw_pixel }.to output(/Invalid colour/).to_stdout
      end
    end

    context 'when pixel has multi character colour' do
      let(:colour) { 'XA' }

      it 'shows an error message' do
        expect { draw_pixel }.to output(/Invalid colour/).to_stdout
      end
    end

    context 'when pixel is within top left bounds' do
      it 'draws a pixel with desired colour' do
        expect(bitmap).to receive(:draw_pixel).with(x, y, colour)
        draw_pixel
      end
    end

    context 'when pixel is within bottom right bounds' do
      let(:x) { bitmap_columns }
      let(:y) { bitmap_rows }

      it 'draws a pixel with desired colour' do
        expect(bitmap).to receive(:draw_pixel).with(x, y, colour)
        draw_pixel
      end
    end
  end
end
