class Job < ActiveRecord::Base
  belongs_to :company
  has_many :applies, dependent: :destroy
  has_many :applied_jobs, :through => :applies, :source => :job
  attr_accessible :job_type, :category, :description, :location, :title, :resume,:resume_id, :role, :salary, :number_of_vacancies

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
