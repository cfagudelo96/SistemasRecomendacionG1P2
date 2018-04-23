class TextRecommendation < ApplicationRecord
  belongs_to :user
  belongs_to :business

  enum category: %i[restaurant bar nightlife]
end
