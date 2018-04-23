class DeleteUnnecesaryUserColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :compliment_hot
  end
end
