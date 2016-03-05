class Api::V1::SpecialistSerializer < Api::V1::BaseSerializer
  attributes :id, :first_name, :last_name, :image, :type, :phone, :rate
  attributes :rates

  def rates
	  ActiveModel::ArraySerializer.new(
	    object.rates,
	    each_serializer: Api::V1::RateSerializer,
	    root: false,
	  )
  end

  def rate
  	object.rates.average(:score)
  end

  def rate_count
  	object.rates.count
  end
end