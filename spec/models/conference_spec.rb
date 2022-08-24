require 'rails_helper'

RSpec.describe Conference, type: :model do
  it { is_expected.to have_many(:tracks) }
  it { is_expected.to validate_presence_of(:name) }
end
