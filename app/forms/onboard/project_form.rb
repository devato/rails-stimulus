class Onboard::ProjectForm < Rectify::Form
  attribute :name, String
  attribute :organization_id, Integer
  attribute :supported_language_id, Integer

  validates :name, :organization_id, :supported_language_id, presence: true
  validate :validate_name_uniqueness

  private

  def validate_name_uniqueness
    return if Current.user.projects.where(name: name).none?
    errors.add(:name, 'Already in use')
  end
end
