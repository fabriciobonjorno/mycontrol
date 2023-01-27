# frozen_string_literal: true

FactoryBot.define do
  factory :bank do
    name { Faker::Bank.name }
    number { [*0..9].sample(3).join }
    user
  end
end
