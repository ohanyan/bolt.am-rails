class Api::V1::UsersController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:show, :update, :destroy]
  before_filter :get_type

  def index
    users = @klass.all

    render(
      json: ActiveModel::ArraySerializer.new(
        users,
        each_serializer: Api::V1::UserSerializer,
        root: 'users',
      )
    )
  end

  def show
    user = @klass.find(params[:id])

    if @klass = Specialist
      render(json: Api::V1::SpecialistSerializer.new(user).to_json)
    else
      render(json: Api::V1::UserSerializer.new(user).to_json)
    end

  end


  def create

    user = @klass.new(create_params)
    return api_error(status: 422, errors: user.errors) unless user.valid?

    user.save!
#    user.activate

    render(
      json: Api::V1::UserSerializer.new(user).to_json,
      status: 201
    )
  end


  def create_params
    params.require(:user).permit(
      :email, :password, :first_name, :last_name
    ).delete_if{ |k,v| v.nil?}

  end
  def update_params
    create_params
  end

end