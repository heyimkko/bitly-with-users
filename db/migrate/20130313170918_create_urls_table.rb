class CreateUrlsTable < ActiveRecord::Migration
  def change
    create_table :urls do |c|
      c.integer :click_count, :default => 0
      c.string :long_url
      c.string :short_url
      c.integer :user_id
      c.timestamps
    end
  end
end
