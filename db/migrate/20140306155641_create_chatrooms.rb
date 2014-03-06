class CreateChatrooms < ActiveRecord::Migration
  def change
  	create_table :chatrooms do |t|
  		t.string :name
  		t.boolean :public?, default: :true
  		t.belongs_to :user

  		t.timestamps
  	end
  end
end
