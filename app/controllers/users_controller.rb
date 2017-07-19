class UsersController < ApplicationController

  def update
    @user = current_user
    @user.role = :standard

    if @user.save
      flash[:notice] = "You are now a standard user."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error updating user role. Please try again."
      redirect_to root_path
    end
  end

end
