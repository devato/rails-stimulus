class User::SignupForm < Rectify::Form
  attribute :name, String
  attribute :email, String
  attribute :password, String
  attribute :password_confirmation, String
  attribute :terms
  attribute :organization_name

  validates :name, :email, :password, :password_confirmation,
            :organization_name, presence: true

  validates :email, email_address: true
  validates :password, confirmation: true, length: { within: 6..40 }

  validate :validate_email_uniqueness

  private

  def validate_email_uniqueness
    return if User.where(email: email).none?
    errors.add(:email, 'Already in use')
  end
end
