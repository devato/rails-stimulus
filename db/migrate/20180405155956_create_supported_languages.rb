class CreateSupportedLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :supported_languages do |t|
      t.string :name, index: true
      t.string :image
      t.boolean :active
    end
  end
end
