# frozen_string_literal: true

class CreateConferences < ActiveRecord::Migration[6.1]
  def change
    create_table :conferences do |t|
      t.string :name, index: true

      t.timestamps
    end
  end
end
