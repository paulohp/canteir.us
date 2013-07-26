class ChangeLimitToResume < ActiveRecord::Migration
  def up
    change_column :resumes, :professional_objctive, :text, :limit => nil
    change_column :resumes, :mini_resume, :text, :limit => nil
  end

  def down
  end
end
