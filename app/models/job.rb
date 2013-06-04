class Job < ActiveRecord::Base
  attr_accessible :category, :description, :location, :title
end
