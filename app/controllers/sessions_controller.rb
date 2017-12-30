class SessionsController < ApplicationController
  def login
    render 'login'
  end

  def createLogin
    @user = User.find_by(email: user_params[:email])
    if @user.present? && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      session[:username] = User.find_by(id: session[:user_id])[:username]
      redirect_to root_url
    else
      flash[:danger] = "Invalid email/password"
      render "new"
    end

  end

  def destroyLogin
    session[:user_id] = nil
    session[:username] = nil
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_digest)
    end

end
