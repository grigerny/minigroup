class ChangePeopleFormatInMyTable < ActiveRecord::Migration
    def self.up
      change_column :events, :people, :integer
    end

    def self.down
      change_column :events, :people, :string
    end
  end
  
