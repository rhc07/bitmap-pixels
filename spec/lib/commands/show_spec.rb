# frozen_string_literal: true

require 'spec_helper'
require 'commands/show'

RSpec.describe Commands::Show do
  let(:bitmap) { ['A B C'] }
  subject(:show_command) { described_class.new.run(bitmap) }

  context 'when bitmap is passed' do
    it 'prints the bitmap' do
      expect { show_command }.to output("A B C\n").to_stdout
    end
  end

  context 'when bitmap is nil' do
    let(:bitmap) { nil }

    it 'shows an error message' do
      expect { show_command }.to output("There is no image\n").to_stdout
    end
  end
end
