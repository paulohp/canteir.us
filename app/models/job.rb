class Job < ActiveRecord::Base
  belongs_to :companies
  attr_accessible :category, :description, :location, :title
end
