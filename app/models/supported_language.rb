class SupportedLanguage < ApplicationRecord

  has_many :applications

  scope :active, -> { where(active: true) }

end
