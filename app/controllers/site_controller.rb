class SiteController < ApplicationController
  def index
    @user = User.new
  end

  def about
  end

  def FAQ
  end

  def privacy
  end

  def signup
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      @user = User.new
      render :index
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
