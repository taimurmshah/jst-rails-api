class UsersController < ApplicationController

  # wrap_parameters :user, include: [:first_name, :last_name, :email,  :password]

  def create
    # byebug
    @user = User.new(user_params)
    puts @user
    if @user.valid?
      @user.save
      render json: {user: @user}, status: :created
    else
      render json: {errors: @user.errors.messages}
    end
  end

  private
  #strong params
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
