class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.references :organization, null: false
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.boolean :terms, default: false
      t.string :crypted_password
      t.string :salt

      t.timestamps null: false
    end
  end
end
