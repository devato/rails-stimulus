class Organization < ApplicationRecord
  multi_tenant :organization

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :user_organizations, dependent: :destroy
  has_many :users, through: :user_organizations
  has_many :projects

  scope :default, -> { where(default: true).first }
end
