# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke::Factory, type: :model do
  subject { described_class.new(attributes) }

  describe '#build' do
    context 'when the attributes match the single joke pattern' do
      let(:attributes) { { id: 1, format: 'single', content: 'content', setup: nil, punchline: nil } }

      it 'instantiates a new single joke' do
        instance = subject.build

        expect(instance).to be_an_instance_of(Joke::SingleJoke)
      end
    end

    context 'when the attributes match the single joke pattern' do
      let(:attributes) { { id: 1, format: 'two_lines', content: nil, setup: 'setup', punchline: 'punchline' } }

      it 'instantiates a new single joke' do
        instance = subject.build

        expect(instance).to be_an_instance_of(Joke::TwoLinesJoke)
      end
    end
  end
end
