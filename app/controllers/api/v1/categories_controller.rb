class Api::V1::CategoriesController < Api::V1::BaseController
	  before_filter :authenticate_user!, only: [:show, :update, :destroy]

def index
    categories = Category.all

    render(
      json: ActiveModel::ArraySerializer.new(
        categories,
        each_serializer: Api::V1::CategorySerializer,
        root: 'categories',
      )
    )
  end
end