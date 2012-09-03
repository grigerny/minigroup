class AddPeopleToEvent < ActiveRecord::Migration
  def change
    add_column :events, :people, :string
  end
end
