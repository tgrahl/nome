class DocumentReference < ActiveRecord::Base
  attr_accessible :ref_document

  has_attached_file :ref_document

  belongs_to :refrence

end
