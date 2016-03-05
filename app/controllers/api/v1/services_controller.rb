class Api::V1::ServicesController < Api::V1::BaseController
	  before_filter :authenticate_user!, only: [:show, :update, :destroy]

def index
    puts categories = params[:categories].split(',')
    services = Service.all

    render(
      json: ActiveModel::ArraySerializer.new(
        services,
        each_serializer: Api::V1::ServiceSerializer,
        root: 'services',
      )
    )
  end
end