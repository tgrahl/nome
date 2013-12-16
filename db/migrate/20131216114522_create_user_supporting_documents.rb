class CreateUserSupportingDocuments < ActiveRecord::Migration
  def change
    create_table :user_supporting_documents do |t|
      t.integer :user_id
      t.integer :supporting_document_id
      t.integer :document_given
      t.integer :certified
      t.timestamps
    end
  end
end
