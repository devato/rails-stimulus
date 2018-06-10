class CreateUserPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :user_preferences, id: :uuid do |t|
      t.belongs_to :user, foreign_key: true
      t.string :language
      t.string :timezone
      t.boolean :twenty_four_hr_clock

      t.timestamps
    end
  end
end
