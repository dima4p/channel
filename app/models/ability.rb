# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= :user

    # Guests
    # return if user.new_record? # Guests

    if user.is? :admin
      can :manage, :all
      cannot :create, User
    else
      can :manage, UserSession
      can :create, User if user.new_record?
      return if user.new_record?

      can [:show, :update], User, :id => user.id
    end
  end
end
