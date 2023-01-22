# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "Group #{n}" }
    status { [0, 1].sample }
    user
  end
end
