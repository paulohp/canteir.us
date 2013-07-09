class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :applies
  has_many :jobs
  attr_accessible :children, :civil, :dob, :gender, :job_area, :mini_resume, :name, :professional_objctive, :user_id
end
