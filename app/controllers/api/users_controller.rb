class Api::UsersController < ApplicationController

  def create
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
