class AddUserIdToHacks < ActiveRecord::Migration[5.1]
  def change
    add_column :hacks, :user_id, :integer
    add_index :hacks, :user_id
  end
end
