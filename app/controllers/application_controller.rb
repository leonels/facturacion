class ApplicationController < ActionController::Base
  protect_from_forgery

  include UrlHelper

  helper_method :current_user
  helper_method :current_subdomain

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_subdomain
    if request.subdomain.empty?
      redirect_to sessions_path
    else
      account = Account.find_by_subdomain(request.subdomain)
    end
  end

end
