require 'csv'

class User < ApplicationRecord
  has_many :reviews
  has_many :recommendations

  def self.export_averages
    CSV.open('./data/user_averages.csv', 'w') do |writer|
      all.each do |user|
        writer << [user.id, user.average_stars]
      end
    end
  end

  def to_s
    name
  end
end
