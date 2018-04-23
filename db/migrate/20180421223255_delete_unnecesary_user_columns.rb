class DeleteUnnecesaryUserColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :compliment_more
    remove_column :users, :compliment_profile
    remove_column :users, :compliment_cute
    remove_column :users, :compliment_list
    remove_column :users, :compliment_note
    remove_column :users, :compliment_plain
    remove_column :users, :compliment_cool
    remove_column :users, :compliment_funny
    remove_column :users, :compliment_writer
    remove_column :users, :compliment_photos
  end
end
