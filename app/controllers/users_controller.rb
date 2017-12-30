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

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_digest)
    end
  
end
