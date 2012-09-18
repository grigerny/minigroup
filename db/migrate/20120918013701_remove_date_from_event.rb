class RemoveDateFromEvent < ActiveRecord::Migration
    def change
      remove_column :events, :when
    end
end
