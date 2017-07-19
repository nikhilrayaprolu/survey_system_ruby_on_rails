class AddTypeofuserToUser < ActiveRecord::Migration
  def change
    add_column :users, :typeofuser, :string
  end
end
