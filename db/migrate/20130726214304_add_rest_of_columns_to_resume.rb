class AddRestOfColumnsToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :cpf, :string
    add_column :resumes, :country, :string
    add_column :resumes, :address, :string
    add_column :resumes, :complement, :string
    add_column :resumes, :district, :string
    add_column :resumes, :postal_code, :string
    add_column :resumes, :state, :string
    add_column :resumes, :city, :string
    add_column :resumes, :tel_residence, :string
    add_column :resumes, :scraps, :string
    add_column :resumes, :tel_celular, :string
    add_column :resumes, :tel_commercial, :string
    add_column :resumes, :fax, :string
    add_column :resumes, :deficience, :boolean
  end
end
