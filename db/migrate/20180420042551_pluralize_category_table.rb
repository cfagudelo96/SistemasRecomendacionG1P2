class PluralizeCategoryTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :category, :categories
  end
end
