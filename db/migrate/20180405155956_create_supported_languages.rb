class CreateSupportedLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :supported_languages do |t|
      t.string :name
      t.boolean :active
    end
  end
end
