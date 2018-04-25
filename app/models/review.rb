require 'csv'

class Review < ApplicationRecord
  belongs_to :business
  belongs_to :user

  Review.joins(business: :category).where('categories.category = "Bars"')

  def self.update_user_info
    user_info_hash = {}
    Review.all.each do |review|
      if user_info_hash[review.user_id]
        user_info_hash[review.user_id][:review_count] += 1
        user_info_hash[review.user_id][:average_stars] += review.stars
      else
        user_info_hash[review.user_id] = { review_count: 1, average_stars: review.stars }
      end
    end
    user_info_hash.each do |uid, hash|
      hash[:average_stars] = hash[:average_stars].to_f / hash[:review_count].to_f
      User.find(uid).update(hash)
    end
  end

  def self.export_bars_recommendations
    CSV.open('./data/bars_stars.csv', 'w') do |writer|
      joins(business: :categories).where('categories.category = "Bars"').each do |review|
        writer << [review.user_id, review.business_id, review.stars]
      end
    end
  end

  def self.export_nightlife_recommendations
    CSV.open('./data/nightlife_stars.csv', 'w') do |writer|
      joins(business: :categories).where('categories.category = "Nightlife"').each do |review|
        writer << [review.user_id, review.business_id, review.stars]
      end
    end
  end
end
