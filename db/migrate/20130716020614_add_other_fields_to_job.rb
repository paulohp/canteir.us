class AddOtherFieldsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :role, :string
    add_column :jobs, :salary, :string
  end
end
