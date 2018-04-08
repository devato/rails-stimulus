class EnablePgcryptoExtension < ActiveRecord::Migration[5.2]
  def up
    # enable_extension_on_all_nodes 'pgcrypto'
    enable_extension_on_all_nodes 'uuid-ossp'
  end

  def down
    # disable_extension 'pgcrypto'
    disable_extension 'uuid-ossp'
  end
end
