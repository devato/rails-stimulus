class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  has_one :onboard
  has_many :user_organizations
  has_many :organizations, through: :user_organizations

  has_many :user_applications
  has_many :applications, through: :user_applications

  def onboard_complete?
    return false unless organizations.size > 0 && applications.size > 0
    if onboard.nil?
      create_onboard!
      false
    else
      onboard.complete?
    end
  end

end
