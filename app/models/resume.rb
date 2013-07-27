class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :applies
  has_many :jobs
  has_many :academics, :dependent => :destroy
  attr_accessible :cpf, :country, :state, :city, :district, :address, :complement, :postal_code, :tel_residence, :scraps, :tel_celular, :tel_commercial, :fax, :deficience,:children, :civil, :dob, :gender, :job_area, :mini_resume, :name, :professional_objctive, :user_id
end
