class PluralizeBusinessTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :business, :businesses
  end
end
