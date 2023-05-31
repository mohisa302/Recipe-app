# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    def initialize(user)
      user ||= User.new
  
      # Define User abilities
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        can :create, Inventory
        can [:update, :destroy], Inventory, user_id: user.id
      end
    end
  end
end
