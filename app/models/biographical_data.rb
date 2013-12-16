class BiographicalData < ActiveRecord::Base
  attr_accessible :assesment_institution, :done_before, :first_name, :gender, :id_number, :initials, :last_assesment_date, :mobile_no, :secondary_no, :surname
  belongs_to :user
  has_one :course

end
