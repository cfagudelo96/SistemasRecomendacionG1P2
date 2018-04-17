class User < ApplicationRecord
  has_many :reviews
  has_many :recommendations

  def to_s
    name
  end
end
