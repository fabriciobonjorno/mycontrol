class AddUserToBanks < ActiveRecord::Migration[6.1]
  if table_exists? 'banks'
    def change
      add_reference :banks, :user, null: false, foreign_key: true, type: :uuid unless column_exists? 'banks', :user_id
    end
  end
end
