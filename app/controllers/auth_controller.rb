class AuthController < ApplicationController

  def create
    @user = User.find_by(email: user_login_params[:email])
  #  need to validate the password with bcrypt: match password with password_digest
    if @user && @user.authenticate(user_login_params[:password])
      @jwt = encode_token({user_id: @user.id})

      render json: {user: @user, jwt: @jwt}, status: 200
    else
      render json: {error: "Login unsuccessful, please try again."}
    end
  end

  def show
    @user = retrieve_user_from_jwt
    if @user
      render json: {user: @user}, status: 200
    else
      render json: { error: "Please authenticate"}, status: 401
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:email, :password)
  end

end
