class AddUserIdToBiographicalData < ActiveRecord::Migration
  def change
  	 add_column :biographical_data, :user_id, :integer
  end
end
