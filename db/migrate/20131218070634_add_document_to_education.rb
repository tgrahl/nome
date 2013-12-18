class AddDocumentToEducation < ActiveRecord::Migration
  def self.up
    add_attachment :educations, :document
  end

  def self.down
    remove_attachment :educations, :document
  end
end
