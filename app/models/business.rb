require 'csv'

class Business < ApplicationRecord
  has_many :reviews
  has_many :categories
  has_many :recommendations

  scope :restaurants, -> { joins(:categories).where(categories: { category: 'Restaurants' }) }
  scope :bars, -> { joins(:categories).where(categories: { category: 'Bars' }) }
  scope :nightlife, -> { joins(:categories).where(categories: { category: 'Nightlife' }) }

  def to_s
    name
  end
end
