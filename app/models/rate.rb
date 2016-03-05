class Rate < ActiveRecord::Base
	belongs_to :rater, class_name: "User"
	belongs_to :rated, class_name: "User"
end
