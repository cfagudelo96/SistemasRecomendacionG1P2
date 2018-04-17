class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.string :user_id
      t.string :business_id
      t.float :recommendation
      t.integer :type

      t.timestamps
    end
  end
end
