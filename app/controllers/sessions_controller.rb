class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user.present? && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      render "dashboard/dashboard.erb"
    else
      flash[:danger] = "Invalid email/password"
      render "new"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_digest)
    end

end
