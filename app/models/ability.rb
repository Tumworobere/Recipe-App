class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, Food, user: user if user.present?
    can :manage, Inventory, user: user if user.present?
    can :manage, InventoryFood, user: user if user.present?
    can :manage, Recipe, user: user if user.present?
    can :read, :all if user.present?
    can :create, :all if user.present?
  end
end
