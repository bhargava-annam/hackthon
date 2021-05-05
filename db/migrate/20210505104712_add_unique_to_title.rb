class AddUniqueToTitle < ActiveRecord::Migration[5.1]
  def change
    add_index :hacks, :title, unique: true
  end
end
