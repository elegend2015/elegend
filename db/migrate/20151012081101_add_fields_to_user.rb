class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :addr, :string
  	add_column :users, :phone, :string
  	add_column :users, :gender, :string
  	add_column :users, :status, :string
  	add_column :users, :about, :text
  	add_column :users, :profile_pic, :string
  end
end
