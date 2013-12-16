class CreateBiographicalData < ActiveRecord::Migration
  def change
    create_table :biographical_data do |t|
      t.string :first_name
      t.string :surname
      t.string :initials
      t.boolean :gender
      t.string :id_number
      t.string :mobile_no
      t.string :secondary_no
      t.boolean :done_before
      t.date :last_assesment_date
      t.string :assesment_institution

      t.timestamps
    end
  end
end
