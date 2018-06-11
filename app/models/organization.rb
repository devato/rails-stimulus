class Organization < ApplicationRecord
  multi_tenant :organization

  extend FriendlyId
  friendly_id :name, use: :sequentially_slugged

  has_many :organization_users, dependent: :destroy
  has_many :users, through: :organization_users
  has_many :projects, dependent: :destroy

  scope :default, -> { find_by(default: true) }

end
