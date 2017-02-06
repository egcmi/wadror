class SessionsController < ApplicationController
  def new
    # render the signing up page
  end

    def create
      user = User.find_by username: params[:username]
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Welcome back!"
      else
        redirect_to :back, notice: "Username and/or password mismatch"
      end
    end

  def destroy
    # resets the session
    session[:user_id] = nil
    # redericts the application to the main page
    redirect_to :root
  end
end