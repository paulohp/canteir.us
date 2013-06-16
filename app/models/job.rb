class Job < ActiveRecord::Base
  belongs_to :companies
  attr_accessible :category, :description, :location, :title

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
