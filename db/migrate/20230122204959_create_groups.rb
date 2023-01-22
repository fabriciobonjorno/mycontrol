# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    return if table_exists? 'groups'

    create_table :groups, id: :uuid do |t|
      t.string :name
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :groups, :name
    add_index :groups, :status
  end
end
