class AddRefDocumentToDocumnetRefrence < ActiveRecord::Migration
  def self.up
    add_attachment :document_references, :ref_document
  end

  def self.down
    add_attachment :document_references, :ref_document
  end
end
