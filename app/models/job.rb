class Job < ActiveRecord::Base
  belongs_to :companies
  has_many :applies
  has_many :applied_rooms, :through => :applies, :source => :job
  attr_accessible :category, :description, :location, :title, :resume

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
