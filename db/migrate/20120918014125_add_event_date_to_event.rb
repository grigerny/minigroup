class AddEventDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :when, :date
  end
end
