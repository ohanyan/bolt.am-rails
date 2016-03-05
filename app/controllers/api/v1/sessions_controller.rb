class Api::V1::SessionsController < Api::V1::BaseController

  #noes https://labs.kollegorna.se/blog/2015/04/build-an-api-now/

  protect_from_forgery :except => :create 
  
  def create

    if create_params[:password]

      user = User.find_by(email: create_params[:email])
      if user && user.authenticate(create_params[:password])
        render(
          json: Api::V1::SessionSerializer.new(user, root: false).to_json,
          status: 201
        )
      else
        return api_error(status: 401)
      end

    elsif create_params[:token]

      @graph = Koala::Facebook::API.new(create_params[:token])

      begin
        profile = @graph.get_object("me", {fields: 'id, name, email'})
      rescue Koala::Facebook::APIError
         return api_error(status: 401)
      end

      email = profile["email"]

      user = User.find_by_email(email)
      image = "http://graph.facebook.com/#{profile['id']}/picture"

      user = User.create(email: email, name: profile["name"], image: image) unless user

      render(
        json: Api::V1::SessionSerializer.new(user, root: false).to_json,
        status: 201
      )
    else
      return api_error(status: 401)
    end
  end

  private
  def create_params
    params.require(:user).permit(:email, :token, :password)
  end
end