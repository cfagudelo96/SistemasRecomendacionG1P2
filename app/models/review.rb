class Review
  include Mongoid::Document

  belongs_to :business
  belongs_to :user

  field :review_id, type: String
  field :_id, type: String, default: -> { review_id }
  field :user_id, type: String
  field :business_id, type: String
  field :stars, type: Integer
  field :text, type: String
  field :useful, type: Integer
  field :funny, type: Integer
  field :cool, type: Integer

  validates :review_id, uniqueness: true

  def self.load_data
    json = File.new('./data/review.json', 'r')
    Yajl::Parser.parse(json) do |review_hash|
      save_review_from_hash(review_hash)
    end
  end

  def self.save_review_from_hash(review_hash)
    review = Review.new(
      review_id: review_hash['review_id'], user_id: review_hash['user_id'],
      business_id: review_hash['business_id'],
      stars: review_hash['stars'], text: review_hash['text'],
      useful: review_hash['useful'], funny: review_hash['funny'],
      cool: review_hash['cool']
    )
    review.save
  end

  private_class_method :save_review_from_hash
end