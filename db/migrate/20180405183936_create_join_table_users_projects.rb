class CreateJoinTableUsersProjects < ActiveRecord::Migration[5.2]
  def change
    create_join_table :project, :users do |t|
      t.index [:user_id, :project_id]
      # t.index [:project_id, :user_id]
    end
  end
end
