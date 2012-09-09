class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def self.up
    change_column :events, :when, :text
  end

  def self.down
    change_column :events, :when, :date
  end
end
