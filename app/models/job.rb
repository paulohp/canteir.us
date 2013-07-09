class Job < ActiveRecord::Base
  belongs_to :company
  has_many :applies, dependent: :destroy
  has_many :applied_jobs, :through => :applies, :source => :job
  attr_accessible :category, :description, :location, :title, :resume,:resume_id

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
