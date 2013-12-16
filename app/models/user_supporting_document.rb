class UserSupportingDocument < ActiveRecord::Base
  attr_accessible :supporting_document_id, :user_id,:document_given,:certified
   belongs_to :supporting_document
   belongs_to :user
end
