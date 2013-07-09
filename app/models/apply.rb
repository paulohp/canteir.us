class Apply < ActiveRecord::Base
  belongs_to :resume
  belongs_to :job
  #validates_uniqueness_of :resume_id
  attr_accessible :resume,:resume_id, :job_id
end
