class CreateUserApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :user_applications, id: false do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :application, foreign_key: true
    end
  end
end
