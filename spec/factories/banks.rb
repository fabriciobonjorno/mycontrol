FactoryBot.define do
  factory :bank do
    name { Faker::Bank.name }
    number { [*0..9].sample(3).join }
  end
end
