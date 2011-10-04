class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create, :index]
  before_filter :find_your_account, :only => [:new, :create]
  
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to dashboard_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def index
    @accounts = Account.all
    respond_to do |format|
      format.html
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
  private
  
  def find_your_account
    if request.subdomain.empty?
      redirect_to sessions_url(:subdomain => false)
    end
  end
  
end
