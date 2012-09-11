class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :events, :tags
  end
end
