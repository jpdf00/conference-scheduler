class Lecture < ApplicationRecord
  belongs_to :track
  
  validates :title, presence: true
  validates :start_at, presence: true
  validates :duration, presence: true
end
