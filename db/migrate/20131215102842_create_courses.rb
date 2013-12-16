class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :educational_institution
      t.string :course_reapplied
      t.string :region
      t.string :field_of_study
      t.integer :biographical_data_id

      t.timestamps
    end
  end
end
