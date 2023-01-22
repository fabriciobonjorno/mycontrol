require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to validate_presence_of(:agency) }
  it { is_expected.to validate_presence_of(:account) }
  it { is_expected.to validate_presence_of(:balance) }
  it { is_expected.to validate_presence_of(:account_type) }
  it { is_expected.to validate_presence_of(:status) }

  it { is_expected.to define_enum_for(:status).with_values({ active: 0, inactive: 1 }) }
  it { is_expected.to define_enum_for(:account_type).with_values({ checking: 0, saving: 1 }) }

  it { is_expected.to belong_to :bank }
  it { is_expected.to belong_to :group }
  it { is_expected.to have_one(:user).through(:group) }
end
