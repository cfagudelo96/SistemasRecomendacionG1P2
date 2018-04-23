class DeleteRecommendations < ActiveRecord::Migration[5.2]
  def change
    drop_table :recommendations
  end
end
