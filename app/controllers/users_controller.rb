class UsersController < ApplicationController
 before_filter  :authenticate_user!

  def index
    @redirect_path = false
    @users = User.all
  end


  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted"
  end



end
