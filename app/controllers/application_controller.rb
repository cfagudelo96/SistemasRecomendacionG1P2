class ApplicationController < ActionController::Base
  private

  def check_current_user
    @current_user ||= session[:current_user_id] && User.find(
      session[:current_user_id]
    )
    return if @current_user
    flash[:error] = 'Debes iniciar sesión antes.'
    redirect_to '/'
  end
end
