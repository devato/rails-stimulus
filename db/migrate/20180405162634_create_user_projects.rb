class CreateUserProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :user_projects, id: false do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :project, foreign_key: true
    end
  end
end
