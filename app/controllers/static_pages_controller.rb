class StaticPagesController < ApplicationController
  def club
    unless logged_in?
      flash[:warning] = "You must be logged in to access to this page"
      redirect_to login_path
    end
  end
end
