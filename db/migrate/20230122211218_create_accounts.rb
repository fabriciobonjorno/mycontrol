class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    return if table_exists? 'accounts'

    create_table :accounts, id: :uuid do |t|
      t.string :agency
      t.string :account
      t.decimal :balance, precision: 10, scale: 2
      t.integer :account_type, default: 0
      t.integer :status, default: 0
      t.references :bank, null: false, foreign_key: true, type: :uuid
      t.references :group, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :accounts, :agency
    add_index :accounts, :account
    add_index :accounts, :status
    add_index :accounts, :account_type
    add_index :accounts, :balance
  end
end
