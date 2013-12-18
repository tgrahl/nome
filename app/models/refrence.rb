class Refrence < ActiveRecord::Base
  attr_accessible :activity_description_place, :education_id, :expirience_from_activity, :referral, :referral_contact_no, :referral_email, :skill_1, :skill_1_description, :skill_2, :skill_2_description, :skill_3, :skill_3_description
  belongs_to :education

  has_many :document_references
end
