class CreateCourseSubjects < ActiveRecord::Migration[5.0]

  def change
    create_table :course_subjects do |t|
      t.integer :course_id
      t.integer :subject_id
      t.integer :status
      t.timestamps
    end
  end
end
