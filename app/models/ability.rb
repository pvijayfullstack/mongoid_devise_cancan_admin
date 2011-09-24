class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.role == "Admin"
      can :manage, :all
    end
    
    if user.role == "User"
      can :update, User
      can [:create, :update, :read], Project
    end
    
  end
end
