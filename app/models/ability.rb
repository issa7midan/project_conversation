# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Project, company_id: user.company_id

    can :manage, Project, company_id: user.company_id, owner_id: user.id

    can :manage, Comment, user_id: user.id

    can :read, Comment, project: { company_id: user.company_id }
  end
end
