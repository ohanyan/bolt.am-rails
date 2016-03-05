class Api::V1::RateSerializer < Api::V1::BaseSerializer
	attributes :id, :score, :rater_firstname, :comment, :date
	def rater_firstname
		object.rater.first_name
	end

	def date
		created_at
	end
end
