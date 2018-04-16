class User
  include Mongoid::Document

  has_many :reviews

  field :user_id, type: String
  field :_id, type: String, default: -> { user_id }
  field :name, type: String
  field :review_count, type: Integer
  field :useful, type: Integer
  field :funny, type: Integer
  field :cool, type: Integer
  field :average_stars, type: Float

  validates :user_id, uniqueness: true

  def to_s
    "#{name} (#{user_id})"
  end

  def self.load_data
    json = File.new('./data/user.json', 'r')
    Yajl::Parser.parse(json) do |user_hash|
      save_user_from_hash(user_hash)
    end
  end

  def self.save_user_from_hash(user_hash)
    user = User.new(
      user_id: user_hash['user_id'],
      name: user_hash['name'],
      review_count: user_hash['review_count'],
      useful: user_hash['useful'],
      funny: user_hash['funny'],
      cool: user_hash['cool'],
      average_stars: user_hash['average_stars']
    )
    user.save
  end

  private_class_method :save_user_from_hash
end