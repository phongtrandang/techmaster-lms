class AdminController < ApplicationController
  before_action :authenticate_admin!

  def authenticate_admin!
    redirect_to root_path if @current_account.role != 'admin'
  end
end