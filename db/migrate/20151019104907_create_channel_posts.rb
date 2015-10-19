class CreateChannelPosts < ActiveRecord::Migration
  def change
    create_table :channel_posts do |t|
      t.text :comment
      t.integer :channel_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
