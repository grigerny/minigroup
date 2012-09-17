class RemovePeopleFromEvents < ActiveRecord::Migration
    def change
      remove_column :events, :people
    end
  end
