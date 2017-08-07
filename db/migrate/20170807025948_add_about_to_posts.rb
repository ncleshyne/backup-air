class AddAboutToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :about, :text
  end
end
