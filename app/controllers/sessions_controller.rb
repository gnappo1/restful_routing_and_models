class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      #set error message with flash
      redirect_to '/login', error: "Invalid credentials"
    end
  end

  def omniauth
    # use byebug to inspect what the auth method returns
    @user = User.from_omniauth(auth)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to "/login"
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
