class Service < ActiveRecord::Base
  belongs_to :specialist
  belongs_to :category
end