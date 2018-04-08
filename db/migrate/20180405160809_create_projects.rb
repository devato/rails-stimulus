class CreateProjects < ActiveRecord::Migration[5.2]
  def up
    create_table :projects, partition_key: :organization_id do |t|
      t.string :name
      t.string :slug, index: true
      t.references :organization, null: false
      t.references :supported_language, null: false
      t.timestamps
    end
    create_distributed_table :projects, :organization_id
  end

  def down
    drop_table :projects
  end
end
