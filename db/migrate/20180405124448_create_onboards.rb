class CreateOnboards < ActiveRecord::Migration[5.2]
  def change
    create_table :onboards do |t|
      t.belongs_to :user, null: false, index: true
      t.string :state

      t.timestamps
    end
  end
end
