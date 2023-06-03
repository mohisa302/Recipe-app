class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    if @user.id.present?
      can :read, :all
      can :create, Inventory
      can :manage, Inventory, user_id: @user.id
    else
      can :read, Inventory
    end
  end
end
