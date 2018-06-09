class UserDecorator < ApplicationDecorator
  delegate_all

  def avatar
    return object.avatar if object.avatar.attached?
  end
end
