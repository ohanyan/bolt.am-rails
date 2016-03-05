class Api::V1::LocationsController < Api::V1::BaseController
	  before_filter :authenticate_user!, only: [:show, :update, :destroy]

def index
    locations = Location.all

    render(
      json: ActiveModel::ArraySerializer.new(
        locations,
        each_serializer: Api::V1::LocationSerializer,
        root: 'locations',
      )
    )
  end
end