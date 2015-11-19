class CreatePannels < ActiveRecord::Migration
  def change
    create_table :pannels do |t|
      t.integer :user_id
      t.string :pannel_img
      t.string :pannel_title

      t.timestamps null: false
    end
  end
end
