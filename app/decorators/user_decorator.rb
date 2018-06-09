class UserDecorator < ApplicationDecorator
  delegate_all

  def avatar
    object.set_default_avatar unless object.avatar.attached?
    object.avatar
  end

  def name
    "#{object.first_name[0]}. #{object.last_name}"
  end
end
