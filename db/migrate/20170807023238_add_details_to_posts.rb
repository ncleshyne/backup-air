class AddDetailsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :property_type, :string
    add_column :posts, :beds, :integer
    add_column :posts, :location, :text
    add_column :posts, :accommodates, :integer
    add_column :posts, :bathrooms, :integer
    add_column :posts, :bedrooms, :integer
    add_column :posts, :room_type, :string
    add_column :posts, :amenities, :text
    add_column :posts, :price, :integer
    add_column :posts, :house_rules, :text
  end
end
