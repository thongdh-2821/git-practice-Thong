class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  def dang_nhap_nguoi_dung
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
