# # frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke::Position, type: :model do
  subject(:position) { described_class.new(input) }

  describe '#value' do
    context 'when the input is nil' do
      let(:input) { nil }

      it 'returns 1' do
        expect(position.value).to eq(1)
      end
    end

    context 'when the input is zero' do
      let(:input) { '0' }

      it 'returns 1' do
        expect(position.value).to eq(1)
      end
    end

    context 'when the input is negative' do
      let(:input) { '-2' }

      it 'returns 1' do
        expect(position.value).to eq(1)
      end
    end

    context 'when the input is positive' do
      let(:input) { '1' }

      it 'returns the positive input as integer' do
        expect(position.value).to eq(1)
      end
    end
  end

  describe '#previous_value' do
    context 'when the input is nil' do
      let(:input) { nil }

      it 'returns 0' do
        expect(position.previous_value).to eq(0)
      end
    end

    context 'when the input is zero' do
      let(:input) { '0' }

      it 'returns 0' do
        expect(position.previous_value).to eq(0)
      end
    end

    context 'when the input is negative' do
      let(:input) { '-2' }

      it 'returns 0' do
        expect(position.previous_value).to eq(0)
      end
    end

    context 'when the input is positive' do
      let(:input) { '1' }

      it 'returns the positive input as integer less one' do
        expect(position.previous_value).to eq(0)
      end
    end
  end

  describe '#next_value' do
    context 'when the input is nil' do
      let(:input) { nil }

      it 'returns 2' do
        expect(position.next_value).to eq(2)
      end
    end

    context 'when the input is zero' do
      let(:input) { '0' }

      it 'returns 2' do
        expect(position.next_value).to eq(2)
      end
    end

    context 'when the input is negative' do
      let(:input) { '-3' }

      it 'returns 2' do
        expect(position.next_value).to eq(2)
      end
    end

    context 'when the input is positive' do
      let(:input) { '1' }

      it 'returns the positive input as integer plus one' do
        expect(position.next_value).to eq(2)
      end
    end
  end
end
