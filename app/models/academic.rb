class Academic < ActiveRecord::Base
  belongs_to :resumes
  attr_accessible :degree, :final, :initial, :institution, :name
end
