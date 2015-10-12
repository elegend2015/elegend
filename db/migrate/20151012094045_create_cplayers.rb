class CreateCplayers < ActiveRecord::Migration
  def change
    create_table :cplayers do |t|
      t.string :name
      t.text :description
      t.string :img

      t.timestamps null: false
    end
  end
end
