class EnablePgcryptoExtension < ActiveRecord::Migration[5.2]
  def change
    enable_extension_on_all_nodes 'pgcrypto'
  end
end
