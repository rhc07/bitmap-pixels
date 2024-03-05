require "spec_helper"
require "bitmap"

RSpec.describe Bitmap do
  subject { bitmap.to_s }

  describe "#to_s" do
    context "with 1x1 bitmap" do
      let(:bitmap) { described_class.new(1, 1) }

      it { is_expected.to eq "O" }
    end

    context "with 2x2 bitmap" do
      let(:bitmap) { described_class.new(2, 2) }

      it { is_expected.to eq "OO\nOO" }
    end
  end

  describe "#draw_pixel" do
    let(:bitmap) { described_class.new(3, 3) }

    before { bitmap.draw_pixel(x, y, colour) }

    context "when drawing pixel 1, 2 with the colour C" do
      let(:x) { 1 }
      let(:y) { 2 }
      let(:colour) { "C" }

      it { is_expected.to eq "OOO\nCOO\nOOO" }
    end
  end

  describe "#draw_horizontal_line" do
    let(:bitmap) { described_class.new(3, 3) }

    before { bitmap.draw_horizontal_line(x1, x2, y, colour) }

    context "when drawing a line with color F" do
      let(:x1) { 1 }
      let(:x2) { 3 }
      let(:y) { 2 }
      let(:colour) { "F" }

      it { is_expected.to eq "OOO\nFFF\nOOO" }
    end
  end

  describe "#draw_vertical_line" do
    let(:bitmap) { described_class.new(3, 3) }

    before { bitmap.draw_vertical_line(x, y1, y2, colour) }

    context "when drawing a line with color F" do
      let(:x) { 2 }
      let(:y1) { 2 }
      let(:y2) { 3 }
      let(:colour) { "H" }

      it { is_expected.to eq "OOO\nOHO\nOHO" }
    end
  end
end
