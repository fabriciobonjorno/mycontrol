# frozen_string_literal: true

class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    return if table_exists? 'banks'

    create_table :banks, id: :uuid do |t|
      t.string :name
      t.string :number, limit: 3

      t.timestamps
    end
    add_index :banks, :name
    add_index :banks, :number
  end
end
