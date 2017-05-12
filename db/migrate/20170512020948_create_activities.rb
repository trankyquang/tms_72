class CreateActivities < ActiveRecord::Migration[5.0]

  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :object_type
      t.integer :object_id
      t.integer :status_before
      t.integer :status_after
      t.timestamps
    end
  end
end
