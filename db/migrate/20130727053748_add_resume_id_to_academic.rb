class AddResumeIdToAcademic < ActiveRecord::Migration
  def change
    add_column :academics, :resume_id, :integer
  end
end
