class Plan < ActiveRecord::Base
  has_many :users
  attr_accessible :name, :period, :price
end
