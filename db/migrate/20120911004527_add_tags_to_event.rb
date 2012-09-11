class AddTagsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :tags, :string
  end
end
