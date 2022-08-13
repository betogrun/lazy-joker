# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke::Find, type: :use_case do
  describe '.call!' do
    context 'failure' do
      let(:repository) { double(find_random_joke: nil) }

      it do
        result = described_class.call(repository: repository, seed: '0.1', position: '1')

        expect(result).to be_a_failure
        expect(result.type).to be(:no_joke)
        expect(repository).to have_received(:find_random_joke) do |seed, position|
          expect(seed).to eq(0.1)
          expect(position.value).to eq(1)
        end
      end
    end

    context 'success' do
      let(:joke) { double }
      let(:repository) { double(find_random_joke: joke) }

      it do
        result = described_class.call(repository: repository, seed: '0.1', position: '1')

        expect(result).to be_a_success
        expect(result.data[:joke]).to_not be_nil
        expect(repository).to have_received(:find_random_joke) do |seed, position|
          expect(seed).to eq(0.1)
          expect(position.value).to eq(1)
        end
      end
    end
  end
end
