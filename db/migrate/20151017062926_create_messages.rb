class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.text :content
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
