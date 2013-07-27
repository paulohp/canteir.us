class AddResumeIdToExperience < ActiveRecord::Migration
  def change
    add_column :experiences, :resume_id, :integer
  end
end
