# frozen_string_literal: true

class CreateIntegrationClientReporters < ActiveRecord::Migration[6.1]
  def change
    create_table :integration_client_reporters, id: :uuid do |t|
      t.text :message
      t.boolean :success
      t.references :reportable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
    add_index :integration_client_reporters, :reportable_id
    add_index :integration_client_reporters, :reportable_type
    add_index :integration_client_reporters, :message
    add_index :integration_client_reporters, :success
  end
end
