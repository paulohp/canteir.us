class AddAddressNumberToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :address_number, :string
  end
end
