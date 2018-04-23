class AddCentroidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :centroid_id, :string
  end
end
