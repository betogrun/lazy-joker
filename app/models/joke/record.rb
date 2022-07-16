# frozen_string_literal: true

class Joke
  class Record < ApplicationRecord
    self.table_name = 'jokes'

    validates :format, presence: true
  end
end
