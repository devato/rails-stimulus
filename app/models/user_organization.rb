class UserOrganization < ApplicationRecord
  multi_tenant :organization
  belongs_to :user
end
