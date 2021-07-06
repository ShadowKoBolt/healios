# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.text :long
      t.string :short
      t.belongs_to :user

      t.timestamps
    end
  end
end
