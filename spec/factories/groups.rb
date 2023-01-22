# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    name { 'MyString' }
    status { 1 }
    user { nil }
  end
end
