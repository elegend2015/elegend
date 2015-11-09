class AddTitleToNewsfeed < ActiveRecord::Migration
  def change
  	add_column :newsfeeds, :feed_title, :string
  end
end
