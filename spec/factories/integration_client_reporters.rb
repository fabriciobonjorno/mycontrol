# frozen_string_literal: true

FactoryBot.define do
  factory :integration_client_reporter do
    message { 'MyText' }
    success { '' }
    reportable { nil }
  end
end
