class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, Food, user: user if user.present?
    can :manage, Inventory, user: user if user.present?
    can :manage, InventoryFood, inventory: { user_id: user.id }
    can :manage, Recipe, user: user if user.present?
    can :read, :all if user.present?
  end
end
