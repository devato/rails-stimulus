class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  has_one :onboard, dependent: :destroy
  has_one :active_organization, dependent: :destroy

  has_many :organization_users, dependent: :destroy
  has_many :organizations, through: :organization_users

  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
end
