class AddTagsToHacks < ActiveRecord::Migration[5.1]
  def change
    add_column :hacks, :tags, :string
  end
end
