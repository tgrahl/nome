class SupportingDocument < ActiveRecord::Base
  attr_accessible :certified, :document_given, :name
  has_many :user_supporting_documents
  has_many :users, through: :user_supporting_documents
end
