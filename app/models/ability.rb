class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.role == "Admin"
      can :manage, :all
    end
    
    if user.role == "User"
      can :update, User
      can :create, Project
      can :index, Project
      can [:update, :read], Project do |project|
        project.user_id == user.id
      end
    end
    
  end
end
