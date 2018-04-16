class Business
  include Mongoid::Document

  has_many :reviews

  field :business_id, type: String
  field :_id, type: String, default: -> { business_id }
  field :name, type: String
  field :neighborhood, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :postal_code, type: String
  field :latitude, type: Float
  field :longitude, type: Float
  field :stars, type: Float
  field :review_count, type: Integer
  field :is_open, type: Integer
  field :categories, type: Array
  field :hours, type: Hash

  validates :business_id, uniqueness: true

  def to_s
    "#{name} (#{business_id})"
  end

  def self.load_data
    json = File.new('./data/business.json', 'r')
    Yajl::Parser.parse(json) do |bh|
      save_business_from_hash(bh)
    end
  end

  def self.save_business_from_hash(bh)
    business = Business.new(
      business_id: bh['business_id'], name: bh['name'],
      neighborhood: bh['neighborhood'], address: bh['address'],
      city: bh['city'], state: bh['state'], postal_code: bh['postal_code'],
      latitude: bh['latitude'], longitude: bh['longitude'],
      stars: bh['stars'], review_count: bh['review_count'],
      is_open: bh['is_open'], categories: bh['categories'], hours: bh['hours']
    )
    business.save
  end

  private_class_method :save_business_from_hash
end