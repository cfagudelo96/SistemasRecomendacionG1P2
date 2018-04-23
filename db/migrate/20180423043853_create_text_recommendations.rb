class CreateTextRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :text_recommendations do |t|
      t.string :user_id
      t.string :business_id
      t.float :value
      t.integer :category

      t.timestamps
    end
  end
end
