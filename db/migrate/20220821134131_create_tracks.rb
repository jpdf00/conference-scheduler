class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.integer :name, index: true
      t.conference :references

      t.timestamps
    end
  end
end
