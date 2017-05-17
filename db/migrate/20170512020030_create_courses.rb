class CreateCourses < ActiveRecord::Migration[5.0]

  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
