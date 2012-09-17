class AddPeopleToEvents < ActiveRecord::Migration
  def change
    add_column :events, :people, :integer
  end
end
