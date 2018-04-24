require 'csv'

class CollaborativeRecommendation < ApplicationRecord
  belongs_to :user
  belongs_to :business
end
