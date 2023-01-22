# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Installment, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_presence_of(:payment_value) }
  it { is_expected.to validate_presence_of(:due_date) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to define_enum_for(:status).with_values({ paid: 0, unpaid: 1 }) }
  it { is_expected.to validate_numericality_of(:payment_value).is_greater_than(0) }
  it { is_expected.to belong_to :financial }
end
