class Api::V1::SessionSerializer < Api::V1::BaseSerializer
  #just some basic attributes
  attributes :id, :email, :first_name, :image, :token

  def token
    object.authentication_token_for_session
  end

  def email
 	object.email_for_session
  end
end