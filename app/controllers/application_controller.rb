class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :set_locale
  protect_from_forgery with: :exception
  private
  def initialize_cart
    if session[:cart_id] and Cart.exists?(session[:cart_id])
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def set_locale
    accept_lang = request.env['HTTP_ACCEPT_LANGUAGE']
    accept_lang = accept_lang.blank? ? nil : accept_lang[/[\A,;]+/]
    locale = params[:locale] || session[:locale] || accept_lang ||
        DEFAULT_LOCALE
    begin
      I18n.locale = locale
      session[:locale] = locale
      rescue
          I18n.locale = :lv
    end
    end


  def authenticate_user
    if session[:user_id]
      # set current_user by the current user object
      @current_user = User.find session[:user_id]
    else
      #redirect_to(:controller => 'admin/sessions', :action => 'login')
      redirect_to '/login'
    end
  end

  #This method for prevent user to access Signup & Login Page without logout
  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'catalog', :action => 'index')
    else
    end
  end
end
