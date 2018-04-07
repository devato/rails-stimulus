class Users::LoginForm < Rectify::Form
  attribute :email, String
  attribute :password, String
  attribute :remember_me, Boolean

  validates :email, :password, presence: true
  validates :email, email_address: true
end
