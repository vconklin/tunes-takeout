class SessionsController < ApplicationController

  def new

  end

  def create
    auth_hash = request.env['omniauth.auth']
    @user = User.find_or_create_from_omniauth(auth_hash)
      if @user
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:notice] = "Failed to save the user"
        redirect_to root_path
      end
  end

  def destroy
    session.delete(:user_id)
    @user = nil
    redirect_to root_path
  end

end
