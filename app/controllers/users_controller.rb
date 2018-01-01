class UsersController < ApplicationController
  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Register Succesful"
      flash[:color] = "valid"
    else
      flash[:notice] = "Register Failed"
      flash[:color] = "invalid"
    end

    render "register"
  end

  def login
    
  end

  def createLogin
    @user = User.find_by(username: user_params[:username])
    if @user.present? && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      session[:user] = @user
      redirect_to root_url
    else
      flash[:danger] = "Invalid email/password"
      render "new"
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
