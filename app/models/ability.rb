class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all

    if user.admin? :admin
      can :manage, :all
    else
      can :manage, Recipe, user_id: user.id
      can :read, :all
    end
  end
end
