class Onboard < ApplicationRecord
  include AASM

  belongs_to :user

   aasm do
     state :registered, initial: true
     state :organization_created
     state :project_created
     state :complete
   end

end
