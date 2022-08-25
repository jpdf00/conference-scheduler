# frozen_string_literal: true

class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.integer :name, index: true
      t.references :conference

      t.timestamps
    end
  end
end
