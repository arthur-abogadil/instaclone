class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.references :by 
      t.references :to
      t.boolean :accepted

      t.timestamps
    end
  end
end
