class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.references :resume
      t.references :job

      t.timestamps
    end
    add_index :applies, :resume_id
    add_index :applies, :job_id
  end
end
