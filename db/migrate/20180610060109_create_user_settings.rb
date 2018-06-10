class CreateUserSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_settings, id: :uuid do |t|
      t.belongs_to :user, foreign_key: true
      t.string :language
      t.string :time_zone
      t.boolean :twenty_four_hr_clock
    end
  end
end
