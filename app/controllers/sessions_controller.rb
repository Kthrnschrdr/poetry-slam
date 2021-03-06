class SessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  
  def new
  end
  
  def create
    master = login(params[:email], params[:password])
      if master
        redirect_to root_path
      else
        render :new, :alert => "Email or password was invalid."
      end
    end
  
  def destroy
    logout
    redirect_to root_path, :notice => "Logged out!"
  end

end
