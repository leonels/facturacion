class ApplicationController < ActionController::Base
  protect_from_forgery

  include UrlHelper

  helper_method :current_user
  helper_method :current_subdomain
  before_filter :authorize
  before_filter :layout

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    if current_user.nil?
      redirect_to sessions_path, :notice => 'Please login'
    end
  end

  def current_subdomain
    if request.subdomain.empty?
      redirect_to sessions_path
    else
      account = Account.find_by_subdomain(request.subdomain)
    end
  end

  def layout
    unless request.subdomain.empty?
      render :layout => 'admin'
    end
  end

end
