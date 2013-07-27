class Experience < ActiveRecord::Base
  belongs_to :resumes
  attr_accessible :company, :final, :functions, :initial, :role
end
