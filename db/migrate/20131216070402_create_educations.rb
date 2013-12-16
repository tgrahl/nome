class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :completion_year
      t.string :completed_qualification
      t.string :final_result
      t.string :endorsment
      t.string :subject_1
      t.string :mark_1
      t.string :subject_2
      t.string :mark_2
      t.string :subject_3
      t.string :mark_3
      t.string :subject_4
      t.string :mark_4
      t.string :subject_5
      t.string :mark_5
      t.string :subject_6
      t.string :mark_6
      t.string :subject_7
      t.string :mark_7
      t.string :subject_8
      t.string :mark_8
      t.string :subject_9
      t.string :mark_9
      t.integer :course_id

      t.timestamps
    end
  end
end
