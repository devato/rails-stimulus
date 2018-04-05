class Onboard < ApplicationRecord
  include AASM

  belongs_to :user

  aasm :state, no_direct_assignment: true do
    state :registered, initial: true
    state :has_organization
    state :complete

    event :organization_created do
      transitions to: :has_organization
    end

    event :finish do
      transitions to: :complete
    end

  end

end
