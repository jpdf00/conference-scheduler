class Conference < ApplicationRecord
  has_many :tracks, dependent: :destroy
end
