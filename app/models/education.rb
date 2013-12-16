class Education < ActiveRecord::Base
  attr_accessible :completed_qualification, :completion_year, :course_id, :endorsment, :final_result, :mark_1, :mark_2, :mark_3, :mark_4, :mark_5, :mark_6, :mark_7, :mark_8, :mark_9, :subject_1, :subject_2, :subject_3, :subject_4, :subject_5, :subject_6, :subject_7, :subject_8, :subject_9
  belongs_to :course
  has_many :refrences
end
