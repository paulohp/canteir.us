class AddFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :picture, :string
    add_column :companies, :website, :string
    add_column :companies, :category, :string
  end
end
