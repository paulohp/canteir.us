class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :dob
      t.string :gender
      t.string :civil
      t.string :children
      t.string :professional_objctive
      t.string :job_area
      t.string :mini_resume

      t.timestamps
    end
  end
end
