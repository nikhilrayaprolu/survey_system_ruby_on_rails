class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :profilepic
      t.string :type
      t.string :joined_at
      t.string :modified_at

      t.timestamps null: false
    end
  end
end
