class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
  def change
    change_column :users, :provider, :string, :null => false, :default => "email"
    change_column :users, :uid, :string, :null => false, :default => ""
    add_column :users, :tokens, :json
    add_index :users, [:uid, :provider],     unique: true
  end
end
