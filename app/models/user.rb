class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one_attached :avatar

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  has_one :onboard, dependent: :destroy
  has_one :active_organization, dependent: :destroy
  has_one :user_preference, dependent: :destroy
  has_one :user_notifications, dependent: :destroy

  has_many :organization_users, dependent: :destroy
  has_many :organizations, through: :organization_users

  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users

  after_create :set_default_avatar

  def set_default_avatar
    return if avatar.attached?
    avatar.attach(io: File.open('lib/assets/missing.png'),
                  filename: 'missing.png',
                  content_type: 'image/png')
  # NOTE: prevent io stream errors in rspec
  # https://github.com/NickolasVashchenko/stopgap_13632
  rescue IOError
    Thread.current.purge_interrupt_queue
  end

end
