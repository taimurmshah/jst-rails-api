class ApplicationController < ActionController::API
  #  for jwt auth

  def encode_token(payload)
    JWT.encode(payload, "my_secret")
  end

  # gets and returns the header
  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    if auth_header
      token = auth_header
      JWT.decode(token, 'my_secret')[0]
    end
  end

  def retrieve_user_from_jwt
    if decoded_token
      user_id = decoded_token["user_id"]

      @user = User.find(user_id)
    end
  end

  def is_logged_in?
    !!retrieve_user_from_jwt
  end
end
