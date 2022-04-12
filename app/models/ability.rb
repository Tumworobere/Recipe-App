# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.present?
        can :manage, Food, user: user
      end
  end
end
