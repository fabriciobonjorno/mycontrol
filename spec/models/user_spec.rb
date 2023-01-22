# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_uniqueness_of(:first_name).case_insensitive }
  it { is_expected.to validate_uniqueness_of(:last_name).case_insensitive }
  it { is_expected.to have_many(:groups).dependent(:destroy) }
end
