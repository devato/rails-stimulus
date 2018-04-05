class Project < ApplicationRecord
  belongs_to :organization
  belongs_to :supported_language

  has_many :user_projects
  has_many :users, through: :user_projects
end
