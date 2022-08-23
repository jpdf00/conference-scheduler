class Track < ApplicationRecord
  enum name: ('A'..'Z').to_a

  belongs_to :conference
  has_many :lectures, dependent: :destroy

  accepts_nested_attributes_for :lectures
end
