class CreateUserOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_organizations, id: false do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :organization, foreign_key: true
    end
  end
end
