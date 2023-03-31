# @Ref: https://github.com/CanCanCommunity/cancancan
# Ref description: guide on how to implement the CanCanCan ruby gem for user authorization

# OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
# SECURE - CanCanCan ability file for configuring user authorization

class Ability
  include CanCan::Ability

  def initialize(user)
    # abilities for not logged in users
    guest_abilities

    return unless user.present?
    # abilities for all logged in users
    authenticated_abilities

    return unless user.admin?
    # abilities for admin users
    admin_abilities
  end

  private

  def guest_abilities
    # define abilities for visitors only
  end

  def authenticated_abilities
    # define abilities for all logged in users
    can :manage, User
  end

  def admin_abilities
    # define abilities for admins only
    can :manage, :all
  end

end
