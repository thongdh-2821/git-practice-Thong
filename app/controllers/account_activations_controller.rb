class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Tai khoan da duoc kich hoat!"
      redirect_to user
    else
      flash[:danger] = "Tai khoan khong hop le"
      redirect_to root_url
    end
  end
end
