# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Joke::Record, type: :model do
  subject { build(:joke, :single) }

  describe 'validations' do
    describe 'type' do
      it { is_expected.to validate_presence_of(:format) }
    end
  end
end
