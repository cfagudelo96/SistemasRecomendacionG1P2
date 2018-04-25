class User < ApplicationRecord
  has_many :reviews
  has_many :text_recommendations
  has_many :collaborative_recommendations

  def recommendations(category)
    result = []
    if category == '3'
      if collaborative_recommendations?
        collaborative_recommendations.order(value: :desc).limit(24).each do |cr|
          tr = TextRecommendation.find_by_user_id_and_business_id(id, cr.business_id)
          if tr
            result << Recommendation.new(cr.business, cr.value * 0.9 + tr.value * 0.1, 'Híbrido (0.7 Colaborativo y 0.3 Texto)')
          else
            result << Recommendation.new(cr.business, cr.value, 'Colaborativo')
          end
        end
        if result.size < 12
          text_recommendations.order(value: :desc).limit(24).each do |tr|
            result << Recommendation.new(tr.business, tr.value, 'Contenido')
            break if result.size == 12
          end
        end
      else
        text_recommendations.order(value: :desc).limit(24).each do |tr|
          result << Recommendation.new(tr.business, tr.value, 'Contenido')
        end
      end
    else
      if collaborative_recommendations?
        collaborative_recommendations.joins(business: :categories).where(categories: {category: Category.to_category(category)}).order(value: :desc).limit(24).each do |cr|
          tr = TextRecommendation.find_by_user_id_and_business_id(id, cr.business_id)
          if tr
            result << Recommendation.new(cr.business, cr.value * 0.9 + tr.value * 0.1, 'Híbrido (0.7 Colaborativo y 0.3 Texto)')
          else
            result << Recommendation.new(cr.business, cr.value, 'Colaborativo')
          end
        end
        if result.size < 12
          text_recommendations.where(category: category).order(value: :desc).limit(24).each do |tr|
            result << Recommendation.new(tr.business, tr.value, 'Contenido')
            break if result.size == 12
          end
        end
      else
        text_recommendations.where(category: category).order(value: :desc).limit(24).each do |tr|
          result << Recommendation.new(tr.business, tr.value, 'Contenido')
        end
      end
    end
    result
  end

  def collaborative_recommendations?
    review_count > 12
  end

  def to_s
    name
  end
end
