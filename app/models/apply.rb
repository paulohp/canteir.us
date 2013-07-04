class Apply < ActiveRecord::Base
  belongs_to :resume
  belongs_to :job
  attr_accessible :resume,:resume_id, :job_id
end
