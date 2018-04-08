class CreateOrganizations < ActiveRecord::Migration[5.2]
  def up
    create_table :organizations, partition_key: :id do |t|
      t.string :name
      t.string :slug, index: true
      t.boolean :default
      t.boolean :active
      t.timestamps
    end
    create_distributed_table :organizations, :id
  end

  def down
    drop_table :organizations
  end
end
