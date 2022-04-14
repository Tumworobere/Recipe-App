class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.present?
      can :manage, Food, user: user 
      can :manage, Inventory, user: user
      can :manage, Recipe, user: user
      can :manage, :all
    end
  end
end
