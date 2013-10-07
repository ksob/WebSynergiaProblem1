class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	#t.belongs_to :roles
  		#t.belongs_to :users 
  		t.integer :role_id
  		t.integer :user_id
  		t.timestamps
    end
  end
end
