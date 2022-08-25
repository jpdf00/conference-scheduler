# frozen_string_literal: true

class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :title, index: true
      t.integer :duration, index: true
      t.string :lecturer

      t.timestamps
    end
  end
end
