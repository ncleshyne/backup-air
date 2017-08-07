class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :languages, :string
    add_column :users, :response_time, :string
    add_column :users, :address, :text
  end
end
