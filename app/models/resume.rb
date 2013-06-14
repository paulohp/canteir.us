class Resume < ActiveRecord::Base
  belongs_to :user
  attr_accessible :children, :civil, :dob, :gender, :job_area, :mini_resume, :name, :professional_objctive, :user_id
end
