# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke::Repository, type: :model do
  describe '.find_random_joke' do
    let(:seed) { SecureRandom.random_number }

    context 'when a single joke is found' do
      before { create(:joke, :single, content: 'content') }

      it 'return a single joke' do
        joke = described_class.find_random_joke(seed, 1)

        expect(joke.format).to eq(:single)
        expect(joke.content).to eq('content')
      end
    end

    context 'when a two lines joke is found' do
      before { create(:joke, :two_lines, setup: 'setup', punchline: 'punchline') }

      it 'return a single joke' do
        joke = described_class.find_random_joke(seed, 1)

        expect(joke.format).to eq(:two_lines)
        expect(joke.setup).to eq('setup')
        expect(joke.punchline).to eq('punchline')
      end
    end

    describe 'when no joke is found' do
      it 'does not return a joke' do
        joke = described_class.find_random_joke(seed, 1)

        expect(joke).to be_nil
      end
    end
  end
end
