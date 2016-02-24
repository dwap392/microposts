class RemoveLocationToMicroposts < ActiveRecord::Migration
  def change
    remove_column :microposts, :location, :text
  end
end
