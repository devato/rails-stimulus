class Current < ActiveSupport::CurrentAttributes
  attribute :user, :organization, :supported_languages,
            :organizations
end
