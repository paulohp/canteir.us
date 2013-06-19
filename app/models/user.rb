class User < ActiveRecord::Base
  validates :email, :presence => true
  validates :password, :confirmation => true
  has_one :resume
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :location, :bio, :email, :password, :password_confirmation, :remember_me

  def jobs_applied
  end

end
