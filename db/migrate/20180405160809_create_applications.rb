class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.string :name
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :supported_language, foreign_key: true

      t.timestamps
    end
  end
end
