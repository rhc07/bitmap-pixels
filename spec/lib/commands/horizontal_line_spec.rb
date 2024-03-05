require "spec_helper"
require "bitmap"
require "commands/horizontal_line"

RSpec.describe Commands::HorizontalLine do
  subject(:horizontal_line) { described_class.new.run(bitmap, x1, x2, y, colour) }

  let(:x1) { "1" }
  let(:x2) { "2" }
  let(:y) { "3" }
  let(:colour) { "X" }

  context "when bitmap is nil" do
    let(:bitmap) { nil }

    it "shows an error message" do
      expect { horizontal_line }.to output(/There is no image/).to_stdout
    end
  end

  context "when bitmap exists" do
    let(:bitmap) { Bitmap.new(bitmap_columns, bitmap_rows) }

    let(:bitmap_columns) { 3 }
    let(:bitmap_rows) { 3 }

    context "when line can be drawn" do
      it "updates the bitmap" do
        expect(bitmap).to receive(:draw_horizontal_line).with(1, 2, 3, "X")

        horizontal_line
      end
    end

    context "when x1 = x2" do
      let(:x1) { "1" }
      let(:x2) { "1" }

      it "updates the bitmap" do
        expect(bitmap).to receive(:draw_horizontal_line).with(1, 1, 3, "X")

        horizontal_line
      end
    end

    context "when x1 < x2" do
      let(:x1) { "2" }
      let(:x2) { "1" }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel is out of bounds because X1 is too small" do
      let(:x1) { "0" }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel is out of bounds because X1 is too big" do
      let(:x1) { (bitmap_columns + 1).to_s }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel is out of bounds because X1 has an invalid value" do
      let(:x1) { "A" }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel is out of bounds because X2 is too small" do
      let(:x2) { "0" }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel is out of bounds because X2 is too big" do
      let(:x2) { (bitmap_columns + 1).to_s }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel is out of bounds because X2 has an invalid value" do
      let(:x2) { "A" }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel is out of bounds because Y is too small" do
      let(:y) { 0 }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel is out of bounds because Y is too big" do
      let(:y) { bitmap_rows + 1 }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel is out of bounds because Y has an invalid value" do
      let(:y) { "A" }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid coordinates/).to_stdout
      end
    end

    context "when pixel has lowercase colour" do
      let(:colour) { "x" }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid colour/).to_stdout
      end
    end

    context "when pixel has multi character colour" do
      let(:colour) { "XA" }

      it "shows an error message" do
        expect { horizontal_line }.to output(/Invalid colour/).to_stdout
      end
    end
  end
end
