require 'csv'

class Review < ApplicationRecord
  belongs_to :business
  belongs_to :user

  def self.export_to_csv
    CSV.open('./data/reviews_stars.csv', 'w') do |writer|
      select(:user_id, :business_id, :stars).all.each do |review|
        writer << [review.user_id, review.business_id, review.stars]
      end
    end
  end
end
