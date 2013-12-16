class Course < ActiveRecord::Base
  attr_accessible :biographical_data_id, :course_reapplied, :educational_institution, :field_of_study, :region
  belongs_to :biographical_data
  has_one :education
end
