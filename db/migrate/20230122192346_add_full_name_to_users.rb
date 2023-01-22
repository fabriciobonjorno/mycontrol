class AddFullNameToUsers < ActiveRecord::Migration[6.1]
  if table_exists? 'users'
    def change
      add_column :users, :first_name, :string, index: true unless column_exists? 'users', :first_name
      add_column :users, :last_name, :string, index: true unless column_exists? 'users', :last_name
    end
  end
end
