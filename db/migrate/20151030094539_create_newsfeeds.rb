class CreateNewsfeeds < ActiveRecord::Migration
  def change
    create_table :newsfeeds do |t|
      t.text :post
      t.text :comment
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
