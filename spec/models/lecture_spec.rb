require 'rails_helper'

RSpec.describe Lecture, type: :model do
  it { is_expected.to belong_to(:track) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:duration) }
  it { is_expected.to validate_presence_of(:start_at) }
end
