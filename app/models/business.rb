require 'csv'

class Business < ApplicationRecord
  has_many :reviews
  has_many :categories
  has_many :recommendations

  scope :restaurants, -> { joins(:categories).where(city: 'Toronto').where(categories: {category: "Restaurants"})}
  scope :bars, -> { joins(:categories).where(city: 'Toronto').where(categories: {category: "Bars"})}
  scope :nightlife, -> { joins(:categories).where(city: 'Toronto').where(categories: {category: "Nightlife"})}
  scope :not_in_toronto, -> { where.not(city: 'Toronto') }
  scope :not_in_categories, -> { where.not(id: Category.select(:business_id).where(category: ["Restaurants", "Bars", "Nightlife"])) }

  def self.delete_not_in_categories
    not_in_categories.destroy_all
  end

  def self.delete_not_in_toronto
    not_in_toronto.destroy_all
  end

  def self.export_restaurants_ids
    File.open('./data/restaurants.txt', 'w') do |f|
      restaurants.select(:id).each do |restaurant|
        f.puts(restaurant.id)
      end
    end
  end

  def self.export_bars_ids
    File.open('./data/bars.txt', 'w') do |f|
      bars.select(:id).each do |bar|
        f.puts(bar.id)
      end
    end
  end

  def self.export_nightlife_ids
    File.open('./data/nightlife.txt', 'w') do |f|
      nightlife.select(:id).each do |nightlifee|
        f.puts(nightlifee.id)
      end
    end
  end

  def self.export_all
    export_restaurants_ids
    export_bars_ids
    export_nightlife_ids
  end

  def reviews_text
    text = ''
    reviews.select('reviews.text').each do |review|
      text += review.text + ' '
    end
    text
  end
end
