class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :applies
  has_many :jobs
  has_many :academics, :dependent => :destroy
  has_many :experiences, :dependent => :destroy
  accepts_nested_attributes_for :academics, allow_destroy: true
  accepts_nested_attributes_for :experiences, allow_destroy: true
  #accepts_nested_attributes_for :experiences, allow_destroy: true
  attr_accessible :academics_attributes,:experiences_attributes, :cpf, :country, :state, :city, :district, :address, :complement, :postal_code, :tel_residence, :scraps, :tel_celular, :tel_commercial, :fax, :deficience,:children, :civil, :dob, :gender, :job_area, :mini_resume, :name, :professional_objctive, :user_id
end
