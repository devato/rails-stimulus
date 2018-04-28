class CreateJoinTableUsersOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :organization, :users do |t|
      t.index [:user_id, :organization_id]
      # t.index [:organization_id, :user_id]
    end
  end
end
