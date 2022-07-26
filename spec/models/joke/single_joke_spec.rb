# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke::SingleJoke, type: :model do
  subject(:single_joke) { described_class.new(id, content) }

  let(:id) { nil }
  let(:content) { nil }

  describe '#id' do
    let(:id) { 1 }

    it { expect(single_joke.id).to be == 1 }
  end

  describe '#content' do
    let(:content) { 'content' }

    it { expect(single_joke.content).to be == 'content' }
  end

  describe '#format' do
    it { expect(single_joke.format).to be == :single }
  end
end
