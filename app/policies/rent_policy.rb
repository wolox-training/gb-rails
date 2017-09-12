class RentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def index?
    user.present? && user == resource.user
  end

  def create?
    user.present? && user == resource.user
  end
end
