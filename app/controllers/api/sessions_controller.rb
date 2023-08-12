class Api::SessionsController < ApplicationController
  # before_action :require_logged_in, only: [:destroy]
  # before_action :required_logged_out, only: [:create]

  def show
    if current_user
      @user = current_user
      render 'api/users/show'
    else
      render json: { user: nil }
    end
  end

  def create
    email = params[:email]
    password = params[:password]
    @user = User.find_by_credentials(email, password)
    if @user
      login(@user)
      render 'api/users/show'
    else
      render json: { errors: ['Email or password was invalid.']}, status: 401
    end
  end

  def destroy
    logout
    render json: { message: 'success' }
  end
end
