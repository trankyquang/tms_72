class CreateUserTasks < ActiveRecord::Migration[5.0]

  def change
    create_table :user_tasks do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :user_subject_id
      t.integer :status
      t.timestamps
    end
  end
end
