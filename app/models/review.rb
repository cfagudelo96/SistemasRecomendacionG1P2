class Review < ApplicationRecord
  belongs_to :business
  belongs_to :user

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
end
