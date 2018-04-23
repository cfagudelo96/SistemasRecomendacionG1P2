class CreateCollaborativeRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborative_recommendations do |t|
      t.string :user_id
      t.string :business_id
      t.float :value

      t.timestamps
    end
  end
end
