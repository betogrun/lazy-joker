# frozen_string_literal: true

FactoryBot.define do
  factory :joke, class: '::Joke::Record' do
    trait :single do
      format { 'single' }
      content { Faker::Lorem.sentence }
    end

    trait :two_line do
      type { 'two_line' }
      setup { Faker::Lorem.sentence }
      punchline { Faker::Lorem.sentence }
    end
  end
end
