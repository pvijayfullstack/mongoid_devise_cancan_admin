class Project
  
  include Mongoid::Document
  
  attr_accessible :name, :tasks_attributes
  
  field :name
  
  validates :name, :presence => true
  
  embeds_many :tasks
  
  referenced_in :user, :inverse_of => :projects
  
  accepts_nested_attributes_for :tasks, :allow_destroy => true
  
end