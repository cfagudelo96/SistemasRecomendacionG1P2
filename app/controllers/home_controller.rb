class HomeController < ApplicationController
  def index

  end

  def load_data
    LoadDataJob.perform_later
    render json: {result: 'Carga de datos encolada'}, status: :ok
  end
end
