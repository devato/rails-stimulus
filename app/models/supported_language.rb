class SupportedLanguage < ApplicationRecord
  scope :active, -> { where(active: true) }
end
