class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render json:  @user
  end

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    puts @user
    if @user.valid?
      @user.save
      render json: {user: @user}, status: 201
    else
      render json: {errors: @user.errors.messages}
    end
  end

  def update
    id = params[:id]
    @user = User.find(id)

    @user.update(user_params)

    render json: @user, status: 200
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render status: 200
  end

  def name
    @user = User.find(params[:id])
    render json: @user.name
  end


  private

  #strong params
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :password)
  end

end
