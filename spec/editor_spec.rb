# frozen_string_literal: true

require 'spec_helper'
require 'editor'

RSpec.describe Editor do
  let(:editor) { described_class.new }

  describe '#execute_commands' do
    subject(:execute_commands) { editor.execute_commands(commands) }
    describe 'I command' do
      context 'with valid dimensions' do
        let(:commands) { ['I 1 1'] }

        it 'should create bitmap' do
          expect(Bitmap).to receive(:new).with(1, 1)

          execute_commands
        end
      end

      context 'with columns = 0' do
        let(:commands) { ['I 0 1'] }

        it 'should not create bitmap' do
          expect(Bitmap).not_to receive(:new).with(1, 1)

          execute_commands
        end

        it 'shows an error message' do
          expect { execute_commands }.to output(/Invalid dimensions/).to_stdout
        end
      end

      context 'with non-integer columns' do
        let(:commands) { ['I 0 A'] }

        it 'should not create bitmap' do
          expect(Bitmap).not_to receive(:new).with(1, 1)

          execute_commands
        end

        it 'shows an error message' do
          expect { execute_commands }.to output(/Invalid dimensions/).to_stdout
        end
      end

      context 'with columns > MAX_SIZE ' do
        let(:commands) { ['I 0 A'] }

        it 'should not create bitmap' do
          expect(Bitmap).not_to receive(:new).with(1, 1)

          execute_commands
        end

        it 'shows an error message' do
          expect { execute_commands }.to output(/Invalid dimensions/).to_stdout
        end
      end

      context 'with rows = 0' do
        let(:commands) { ['I 0 1'] }

        it 'should not create bitmap' do
          expect(Bitmap).not_to receive(:new).with(1, 1)

          execute_commands
        end

        it 'shows an error message' do
          expect { execute_commands }.to output(/Invalid dimensions/).to_stdout
        end
      end

      context 'with non-integer rows' do
        let(:commands) { ['I 0 A'] }

        it 'should not create bitmap' do
          expect(Bitmap).not_to receive(:new).with(1, 1)

          execute_commands
        end

        it 'shows an error message' do
          expect { execute_commands }.to output(/Invalid dimensions/).to_stdout
        end
      end

      context 'with rows > MAX_SIZE ' do
        let(:commands) { ['I 0 A'] }

        it 'should not create bitmap' do
          expect(Bitmap).not_to receive(:new).with(1, 1)

          execute_commands
        end

        it 'shows an error message' do
          expect { execute_commands }.to output(/Invalid dimensions/).to_stdout
        end
      end
    end

    describe 'C command' do
      context 'without previously created bitmap' do
        let(:commands) { ['C'] }

        it "doesn't clear bitmap" do
          expect(Bitmap).not_to receive(:new)

          execute_commands
        end

        it 'shows an error message' do
          expect { execute_commands }.to output(/There is no image/).to_stdout
        end
      end
    end

    describe 'H command' do
      let(:commands) { ['H 1 1 1 X'] }
      let(:command_runner) { double(:horizontal_line) }

      before do
        allow(Commands::HorizontalLine).to receive(:new).and_return(command_runner)
      end

      it 'should execute HorizontalLine command' do
        expect(command_runner).to receive(:run).with(nil, '1', '1', '1', 'X')

        execute_commands
      end
    end

    describe 'V command' do
      let(:commands) { ["V 4 2 4 K" ]}
      let(:command_runner) { double(:vertical_line) }

      before do
        allow(Commands::VerticalLine).to receive(:new).and_return(command_runner)
      end

      it 'should execute VerticalLine command' do
        expect(command_runner).to receive(:run).with(nil, '4', '2', '4', 'K')

        execute_commands
      end
    end
  end
end
