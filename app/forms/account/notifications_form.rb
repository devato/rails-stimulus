class Account::NotificationsForm < Rectify::Form
  attribute :full_name, String
  attribute :email, String
  attribute :language, String
  attribute :time_zone, String
  attribute :avatar, String

  validates :full_name, :email, :language, :time_zone, presence: true
  validates :email, email_address: true

end
