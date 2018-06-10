class User::Setting < ApplicationRecord
  belongs_to :user

  DEFAULTS = {
    language: :en,
    time_zone: '-0000',
    twenty_four_hr_clock: false,
  }
end
