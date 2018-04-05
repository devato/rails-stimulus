class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :slug
      t.string :size
      t.string :industry
      t.string :website
      t.boolean :default

      t.timestamps
    end
  end
end
