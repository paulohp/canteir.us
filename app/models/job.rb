class Job < ActiveRecord::Base
  belongs_to :companies
  attr_accessible :category, :description, :location, :title

  def self.search search
    if search
      where 'name LIKE ?', "%#{search}%"
    else
      scoped
    end
  end
end
