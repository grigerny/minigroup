class AddVerbToEvent < ActiveRecord::Migration
  def change
    add_column :events, :verb, :string
  end
end
