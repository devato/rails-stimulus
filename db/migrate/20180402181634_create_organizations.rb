class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations, id: :uuid, partition_key: :id do |t|
      t.string :name
      t.string :slug, index: true
      t.boolean :default
      t.timestamps
    end
    create_distributed_table :organizations, :id
  end
end
