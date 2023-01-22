# frozen_string_literal: true

FactoryBot.define do
  factory :installment do
    sequence(:name) { |n| "Installment #{n}" }
    number { rand(1..99) }
    payment_value { rand(0..999) }
    due_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    note { 'MyString' }
    status { [0, 1].sample }
    financial
  end
end
