require 'csv'

class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :business

  enum recommendation_type: %i[collaborative text]

  def self.load_recommendations
    File.open('./data/recommendations.csv') do |file|
      file.each_line do |line|
        split = line.split(';')
        if split.size == 3
          user_id = split[0][1..-2]
          user = User.find_by_id(user_id)
          business_id = split[1][1..-2]
          business = Business.find_by_id(business_id)
          recommendation = split[2].to_f
          puts "No encontrado en linea: #{line}" if user.blank? || business.blank?
          create(user: user, business: business, recommendation: recommendation, recommendation_type: recommendation_types[:collaborative])
        else
          puts "Error en linea: #{line}"
          File.write('./data/errores.txt', line, mode: 'a')
        end
      end
    end
  end
end
