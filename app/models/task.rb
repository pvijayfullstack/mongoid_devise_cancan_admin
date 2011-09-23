class Task
  
  include Mongoid::Document
  
  field :name
  
  validates :name, :presence => true
  
  embedded_in :project, :inverse_of => :tasks
  
end