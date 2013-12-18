class CreateDocumentReferences < ActiveRecord::Migration
  def change
    create_table :document_references do |t|
      t.integer :refrence_id
      t.timestamps
    end
  end
end
