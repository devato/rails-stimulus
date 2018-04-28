class CreateActiveOrganization < ActiveRecord::Migration[5.2]
  def change
    create_table :active_organizations, id: false do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
    end
  end
end
