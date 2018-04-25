class Category < ApplicationRecord
  belongs_to :business

  def self.to_category(int)
    if int == '0'
      'Restaurants'
    elsif int == '1'
      'Bars'
    else
      'Nightlife'
    end
  end

  def to_s
    category
  end
end
