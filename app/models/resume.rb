class Resume < ActiveRecord::Base
  attr_accessible :children, :civil, :dob, :gender, :job_area, :mini_resume, :name, :professional_objctive
end
