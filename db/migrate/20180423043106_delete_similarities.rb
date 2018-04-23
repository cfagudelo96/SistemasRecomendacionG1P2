class DeleteSimilarities < ActiveRecord::Migration[5.2]
  def change
    drop_table :similarities
  end
end
