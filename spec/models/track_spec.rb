require 'rails_helper'

RSpec.describe Track, type: :model do
  it { is_expected.to belong_to(:conference) }
  it { is_expected.to have_many(:lectures) }
  it { is_expected.to validate_presence_of(:name) }
end
