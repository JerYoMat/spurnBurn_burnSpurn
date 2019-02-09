class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  def set_user
    @user = User.find(params[:id])
  end
end
