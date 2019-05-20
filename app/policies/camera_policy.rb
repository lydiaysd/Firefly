class CameraPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude: nil)
    end
  end

  def show?
    true
  end

  def create?
    user
  end

  def destroy?
    record.user == user
  end
end
