class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  has_one :onboard
  has_many :organization_users
  has_many :organizations, through: :organization_users

  has_many :project_users
  has_many :projects, through: :project_users

  def onboard_complete?
    true
    # return false unless !organizations.empty? && !projects.empty?
    # if onboard.nil?
    #   create_onboard!
    #   false
    # else
    #   onboard.complete?
    # end
  end
end
