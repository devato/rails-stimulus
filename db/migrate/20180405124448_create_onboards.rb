class CreateOnboards < ActiveRecord::Migration[5.1]
  def change
    create_table :onboards do |t|
      t.belongs_to :user, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
