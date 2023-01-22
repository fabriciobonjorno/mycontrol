FactoryBot.define do
  factory :financial do
    transaction_type { [0, 1].sample }
    total_transaction { rand(0..999) }
    account
  end
end
