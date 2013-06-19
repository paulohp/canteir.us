class Job < ActiveRecord::Base
  belongs_to :companies
  has_many :applies
  attr_accessible :category, :description, :location, :title

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
