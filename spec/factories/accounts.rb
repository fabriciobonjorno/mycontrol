FactoryBot.define do
  factory :account do
    agency { Faker::Bank.routing_number }
    account { Faker::Bank.account_number }
    balance { rand(0..999) }
    account_type { [0, 1].sample }
    status { [0, 1].sample }
    bank
    group
  end
end
