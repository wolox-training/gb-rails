class RentPolicy < ApplicationPolicy
  attr_reader :rent
  private :rent

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def index?
    user.present? && user == rent.user
  end

  def create?
    user.present? && user == rent.user
  end
end
