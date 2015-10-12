class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.text :description
      t.string :img

      t.timestamps null: false
    end
  end
end
