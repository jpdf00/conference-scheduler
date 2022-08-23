class AddStartAtToLectures < ActiveRecord::Migration[6.1]
  def change
    add_column :lectures, :start_at, :time
  end
end
