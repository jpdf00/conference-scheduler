class Conference < ApplicationRecord
  has_many :tracks, dependent: :destroy

  validates :name, presence: true
end
