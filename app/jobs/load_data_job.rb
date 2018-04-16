class LoadDataJob < ApplicationJob
  queue_as :default

  def perform
    User.load_data
    Business.load_data
    Review.load_data
  end
end
