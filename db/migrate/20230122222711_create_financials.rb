# frozen_string_literal: true

class CreateFinancials < ActiveRecord::Migration[6.1]
  def change
    return if table_exists? 'financials'

    create_table :financials, id: :uuid do |t|
      t.integer :transaction_type, default: 0
      t.decimal :total_transaction, precision: 10, scale: 2
      t.references :account, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :financials, :transaction_type
    add_index :financials, :total_transaction
  end
end
