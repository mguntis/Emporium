class SessionsController < ApplicationController

  before_filter :authenticate_user, :except => [ :login, :login_attempts, :logout]
  before_filter :save_login_state, :only => [ :login, :login_attempts]

  def home
    #Home Page
  end

  def profile
    #Profile Page
  end

  def setting
    #Setting Page
  end

  def login
    #Login Form
  end

  def login_attempts
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to :controller => 'catalog', :action => 'index'


    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

end