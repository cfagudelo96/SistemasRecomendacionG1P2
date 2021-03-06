class RecommendationsController < ApplicationController
  before_action :check_current_user, only: %i[index logout]

  def index
    if params[:category]
      @recommendations = @current_user.recommendations(params[:category])
      @selected = params[:category]
    end
  end

  def login
    user = User.find(params[:user_id])
    session[:current_user_id] = user.id
    redirect_to '/recommendations'
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Usuario no encontrado.'
    redirect_to '/'
  end

  def logout
    session[:current_user_id] = nil
    redirect_to '/'
  end
end
