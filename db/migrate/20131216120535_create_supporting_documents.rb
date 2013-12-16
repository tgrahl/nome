class CreateSupportingDocuments < ActiveRecord::Migration
  def change
    create_table :supporting_documents do |t|
      t.string :name
      t.timestamps
    end
  end
end
