class PluralizeReviewTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :review, :reviews
  end
end
