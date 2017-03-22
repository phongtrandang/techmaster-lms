class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :email, :password)
  end
end
