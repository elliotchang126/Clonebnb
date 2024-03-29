class Api::UsersController < ApplicationController
  wrap_parameters include: User.attribute_names + ['password']

  def create
    @user = User.new(user_params)
    
    if @user.save
      login(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def index
    @users = User.all
      render :index
  end

  def show
    @user = User.includes(:reviews, :reservations).find_by(id: params[:id])
    if @user
      render 'api/users/host'
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def check_email
    email = params[:email]

    if email.blank?
      render json: {errors: ['Email is required']}, status: 400
      return
    end

    unless email =~ URI::MailTo::EMAIL_REGEXP
      render json: {errors: ["Enter a valid email."]}, status: 400
      return
    end

    @user = User.find_by(email: email)
    if @user
      render json: { exists: true }
    else
      render json: { exists: false }
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
