class AddImageToSupportedLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :supported_languages, :image, :string
  end
end
