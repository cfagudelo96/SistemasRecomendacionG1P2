class Recommendation
  attr_reader :business
  attr_reader :value
  attr_reader :type

  def initialize(business, value, type)
    @business = business
    @value = value
    @type = type
  end
end