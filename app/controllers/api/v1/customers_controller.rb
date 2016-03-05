class Api::V1::CustomersController < Api::V1::UsersController
  def get_type
  	@klass = Customer
  end
end