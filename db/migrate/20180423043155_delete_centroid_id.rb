class DeleteCentroidId < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :centroid_id
  end
end
