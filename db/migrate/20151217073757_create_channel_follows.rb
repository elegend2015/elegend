class CreateChannelFollows < ActiveRecord::Migration
  def change
    create_table :channel_follows do |t|
		t.integer :channel_id
      	t.integer :user_id
      t.timestamps null: false
    end
  end
end
