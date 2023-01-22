# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Financial, type: :model do
  it { is_expected.to validate_presence_of(:transaction_type) }
  it { is_expected.to define_enum_for(:transaction_type).with_values({ credit: 0, debit: 1 }) }
  it { is_expected.to belong_to :account }
  it { is_expected.to have_one(:group).through(:account) }
  it { is_expected.to have_many(:installments).dependent(:destroy) }
end
