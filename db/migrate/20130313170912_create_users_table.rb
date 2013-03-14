class CreateUsersTable < ActiveRecord::Migration
  
  def change
    create_table :users do |c|
      c.string :email
      c.string :password
      c.string :remember_token
      c.timestamps
    end
  end
end
