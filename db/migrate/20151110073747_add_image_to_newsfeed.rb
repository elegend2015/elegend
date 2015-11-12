class AddImageToNewsfeed < ActiveRecord::Migration
  def change
    add_column :newsfeeds, :image, :string
  end
end
