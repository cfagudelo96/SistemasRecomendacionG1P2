class LoadRecommendationsJob < ApplicationJob
  queue_as :default

  def perform
    Recommendation.load_recommendations
  end
end
