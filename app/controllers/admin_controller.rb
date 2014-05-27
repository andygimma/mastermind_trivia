class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    if not current_user.admin?
      redirect_to root_path
    end
    
    @users = User.all
    
    @user = User.new
  end
  
  def create_user
    if not current_user.admin?
      redirect_to root_path
    end
    u = User.new(:email => params["email"], :password => params["password"], :password_confirmation => params["password"])
    u.save
    
    redirect_to admin_path
  end
  
  def delete_user
    User.find(params["id"]).destroy
    redirect_to admin_path
  end
  
  def make_admin
    @user = User.find(params["id"])
    @user.update_attribute(:admin, true)
    redirect_to admin_path
  end
  
  def remove_admin
    @user = User.find(params["id"])
    @user.update_attribute(:admin, false)
    redirect_to admin_path
  end
  
end
