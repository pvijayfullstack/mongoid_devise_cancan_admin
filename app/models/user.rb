class User
  
  include Mongoid::Document
  
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :role
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :rememberable

  devise :database_authenticatable, :recoverable, :trackable, :validatable, :registerable
  
  references_many :projects
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :role, :presence => true
  
  field :first_name
  field :last_name
  field :role
  
  ROLES = ['Admin', 'User']
  
  def name
    "#{first_name} #{last_name}"
  end
  
end