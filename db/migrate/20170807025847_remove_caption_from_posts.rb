class RemoveCaptionFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :caption, :string
  end
end
