class AddTrackIdToLectures < ActiveRecord::Migration[6.1]
  def change
    add_reference :lectures, :track, null: false, foreign_key: true
  end
end
