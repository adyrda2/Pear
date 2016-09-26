class UsersController < ApplicationController
  # before_filter :current_user

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end
end
