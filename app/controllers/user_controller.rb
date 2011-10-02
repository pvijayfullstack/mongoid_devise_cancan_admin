class UserController < ApplicationController
  
  def destroy
    @user = User.find(params[:id])
		@user.destroy
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to dashboard_index_path
    end
  end

end
