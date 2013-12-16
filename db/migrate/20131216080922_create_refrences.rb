class CreateRefrences < ActiveRecord::Migration
  def change
    create_table :refrences do |t|
      t.text :activity_description_place
      t.text :expirience_from_activity
      t.string :skill_1
      t.string :skill_1_description
      t.string :skill_2
      t.string :skill_2_description
      t.string :skill_3
      t.string :skill_3_description
      t.string :referral
      t.string :referral_contact_no
      t.string :referral_email
      t.integer :education_id

      t.timestamps
    end
  end
end
