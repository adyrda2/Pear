class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
