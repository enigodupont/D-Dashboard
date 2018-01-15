class UsersController < ApplicationController
  def register
    if !session[:user].nil? and !session[:user]['username'].nil?
      redirect_to root_url
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:user] = @user
      redirect_to root_url
    else
      flash[:notice] = "Register Failed"
      flash[:color] = "invalid"
      render "register"
    end

  end

  def login
    if !session[:user].nil? and !session[:user]['username'].nil?
      redirect_to root_url
    end
  end

  def createLogin
    @user = User.find_by(username: user_params[:username])
    if @user.present? && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      session[:user] = @user
      redirect_to root_url
    else
      flash[:danger] = "Invalid username/password"
      render "login"
    end

  end

  def destroyLogin
    session[:user_id] = nil
    session[:user] = nil
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_digest)
    end
  
end
