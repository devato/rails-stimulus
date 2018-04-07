class CreateOnboards < ActiveRecord::Migration[5.2]
  def change
    create_table :onboards, id: :uuid do |t|
      t.belongs_to :user, null: false, index: true
      t.string :state

      t.timestamps
    end
  end
end
