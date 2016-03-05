class Api::V1::SpecialistsController < Api::V1::UsersController
  skip_before_filter :authenticate_user!
  def get_type
  	 @klass = Specialist
  end
end