require 'csv'

class TextRecommendation < ApplicationRecord
  belongs_to :user
  belongs_to :business

  enum category: %i[restaurant bar nightlife]

  def self.load_restaurants_recommendations
    numero = 1000
    while numero <= 73000
      CSV.foreach("./data/recomendaciones_restaurants_#{numero}.csv", col_sep: ';', headers: false) do |row|
        r = TextRecommendation.new(user_id: row[0],
                                   business_id: row[1],
                                   value: row[2].to_f,
                                   category: :restaurant)
        unless r.save
          File.open('./data/restaurants_errors', 'a+') { |f| f << "#{row[0]};#{row[1]};#{row[2]}" }
        end
      end
      numero += 1000
    end
  end

  def self.load_bars_recommendations
    CSV.foreach('./data/recomendaciones_bars.csv', col_sep: ';', headers: false) do |row|
      r = TextRecommendation.new(user_id: row[0],
                                 business_id: row[1],
                                 value: row[2].to_f,
                                 category: :bar)
      unless r.save
        File.open('./data/bars_errors', 'a+') { |f| f << "#{row[0]};#{row[1]};#{row[2]}" }
      end
    end
  end

  def self.load_nightlife_recommendations
    CSV.foreach('./data/recomendaciones_nightlife.csv', col_sep: ';', headers: false) do |row|
      r = TextRecommendation.new(user_id: row[0],
                                 business_id: row[1],
                                 value: row[2].to_f,
                                 category: :nightlife)
      unless r.save
        File.open('./data/nightlife_errors', 'a+') { |f| f << "#{row[0]};#{row[1]};#{row[2]}" }
      end
    end
  end
end
