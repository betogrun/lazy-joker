# frozen_string_literal: true

FactoryBot.define do
  factory :joke, class: '::Joke::Record' do
    trait :single do
      format { 'single' }
      content { Faker::Lorem.sentence }
      setup { nil }
      punchline { nil }
    end

    trait :two_lines do
      format { 'two_lines' }
      content { nil }
      setup { Faker::Lorem.sentence }
      punchline { Faker::Lorem.sentence }
    end
  end
end
