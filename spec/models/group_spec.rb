# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to define_enum_for(:status).with_values({ active: 0, inactive: 1 }) }
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:accounts).dependent(:destroy) }
end
