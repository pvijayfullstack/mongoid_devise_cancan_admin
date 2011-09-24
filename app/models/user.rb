class User
  
  include Mongoid::Document
  
  attr_accessor :login
  
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :username, :role, :login
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :rememberable

  devise :database_authenticatable, :recoverable, :trackable, :validatable, :registerable
  
  references_many :projects
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, :presence => true
  validates :role, :presence => true
  
  field :first_name
  field :last_name
  field :username
  field :role
  
  key :username
  
  ROLES = ['Admin', 'User']
  
  protected

    def self.find_for_database_authentication(conditions)
      login = conditions.delete(:login)
      self.any_of({ :username => login }, { :email => login }).first
    end
  
end