# frozen_string_literal: true

class AddStatusToBanks < ActiveRecord::Migration[6.1]
  if table_exists? 'banks'
    def change
      add_column :banks, :status, :integer, index: true unless column_exists? 'banks', :status
    end
  end
end
