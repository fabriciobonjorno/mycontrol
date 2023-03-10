# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bank, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_uniqueness_of(:number).case_insensitive }
  it { is_expected.to have_many(:accounts).dependent(:destroy) }
  it { is_expected.to belong_to :user }
end
