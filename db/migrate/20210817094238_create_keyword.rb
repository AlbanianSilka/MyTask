# frozen_string_literal: true

# Migration class to create a keywords
class CreateKeyword < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.string :key
      t.string :link
      t.timestamps
    end
  end
end
