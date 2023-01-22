# frozen_string_literal: true

class CreateInstallments < ActiveRecord::Migration[6.1]
  def change
    return if table_exists? 'installments'

    create_table :installments, id: :uuid do |t|
      t.string :name
      t.integer :number
      t.decimal :payment_value, precision: 10, scale: 2
      t.date :payment_date
      t.date :due_date
      t.string :note
      t.integer :status, default: 0
      t.references :financial, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :installments, :name
    add_index :installments, :number
    add_index :installments, :due_date
    add_index :installments, :status
    add_index :installments, :note
    add_index :installments, :payment_value
    add_index :installments, :payment_date
  end
end
