class AddLanguagesToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :languages, :string
  end
end
