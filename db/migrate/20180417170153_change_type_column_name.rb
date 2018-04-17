class ChangeTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :recommendations, :type, :recommendation_type
  end
end
