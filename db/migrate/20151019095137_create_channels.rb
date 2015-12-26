class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
    	t.integer :user_id
      t.string :name
      t.text :description
      t.string :channel_img
      t.string :channel_type

      t.timestamps null: false
    end
  end
end