class AddUsernameToHacks < ActiveRecord::Migration[5.1]
  def change
    add_column :hacks, :username, :string
  end
end
