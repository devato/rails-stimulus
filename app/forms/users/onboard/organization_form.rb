class Onboard::OrganizationForm < Rectify::Form
  attribute :name,  String
  attribute :size,  String
  attribute :industry, String

  validates :name, presence: true

end
