class AddNumberOfVacanciesToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :number_of_vacancies, :string
  end
end
