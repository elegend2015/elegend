class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.text :description
      t.string :img
      t.string :channel_type

      t.timestamps null: false
    end
  end
end