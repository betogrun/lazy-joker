# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke::TwoLinesJoke, type: :model do
  subject(:two_lines_joke) { described_class.new(id, setup, punchline) }

  let(:id) { nil }
  let(:setup) { nil }
  let(:punchline) { nil }

  describe '#id' do
    let(:id) { 1 }

    it { expect(two_lines_joke.id).to be == 1 }
  end

  describe '#setup' do
    let(:setup) { 'setup' }

    it { expect(two_lines_joke.setup).to be == 'setup' }
  end

  describe '#punchline' do
    let(:punchline) { 'punchline' }

    it { expect(two_lines_joke.punchline).to be == 'punchline' }
  end

  describe '#format' do
    it { expect(two_lines_joke.format).to be == :two_lines }
  end
end
