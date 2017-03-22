class SessionsController < ApplicationController
  skip_before_action :authenticate_account!, only: [:new, :create]

  def new
    if session[:current_account_id]
      return redirect_to root_path
    end
  end

  def create
    # binding.pry

    # if we can authenticate user
    # redirect root_path
    # else
    # render action new to re-enter login credentials

    authorized_account = Account.authenticate(params[:email], params[:password])

    if authorized_account
      session[:current_account_id] = authorized_account.id
      redirect_to root_path
    else
      render :new
    end

  end

  def destroy
    session[:current_account_id] = nil
    redirect_to account_login_path
  end

end