class Onboard < ApplicationRecord
  include AASM

  belongs_to :user

  aasm :state, no_direct_assignment: true do
    state :registered, initial: true
    state :has_organization
    state :has_application
    state :complete

    event :organization_created do
      transitions from: :registered, to: :has_organization
    end

    event :application_created do
      transitions from: :has_organization, to: :has_application
    end

    event :finish do
      transitions from: :has_application, to: :complete
    end

  end

end
