class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.role? :administrator
      can :manage, :all
    elsif user.role? :moderator
      can :manage, Mission
    else
      can :create, Mission
      can :manage, Mission do |mission|
        # try if mission is nil
        mission.try(:user) == user
      end
      can :read, :all
    end
  end
end
