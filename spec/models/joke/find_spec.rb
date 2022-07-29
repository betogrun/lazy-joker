# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke::Find, type: :use_case do
  describe '.call!' do
    let(:seed) { 0.1 }
    let(:position) { 1 }

    context 'failure' do
      let(:repository) { double(find_random_joke: nil) }

      it do
        result = described_class.call(repository: repository, seed: seed, position: position)

        expect(result).to be_a_failure
        expect(result.type).to be(:no_joke)
        expect(repository).to have_received(:find_random_joke).with(seed, position)
      end
    end

    context 'success' do
      let(:joke) { double }
      let(:repository) { double(find_random_joke: joke) }

      it do
        result = described_class.call(repository: repository, seed: seed, position: position)

        expect(result).to be_a_success
        expect(result.data[:joke]).to_not be_nil
        expect(repository).to have_received(:find_random_joke).with(seed, position)
      end
    end
  end
end
