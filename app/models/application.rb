class Application < ApplicationRecord
  belongs_to :organization
  belongs_to :supported_language

  has_many :user_applications
  has_many :users, through: :user_applications
end
