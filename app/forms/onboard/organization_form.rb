class Onboard::OrganizationForm < Rectify::Form
  attribute :name,  String
  attribute :size,  String
  attribute :industry, String

  validates :name, presence: true
  validate :validate_name_uniqueness

  private

  def validate_name_uniqueness
    return if Organization.where(name: name).none?
    errors.add(:name, 'Already in use')
  end
end
