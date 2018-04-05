class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.belongs_to :organization, foreign_key: true
      t.belongs_to :supported_language, foreign_key: true

      t.timestamps
    end
  end
end
