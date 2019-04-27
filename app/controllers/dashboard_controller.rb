class DashboardController < ApplicationController
  def index
    
  end

  def aboutus
    
  end

  
  def healthz
    render json: {
      status: 200,
      message: "It's ALIVE"
    }.to_json
  end
end
