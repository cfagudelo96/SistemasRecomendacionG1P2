class User < ApplicationRecord
  has_many :reviews

  def to_s
    name
  end
end
