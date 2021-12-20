class DashboardController < ApplicationController
  def index
    # Empty since it leads to the simple index page.
  end

  def aboutus
    # Empty since it leads to the simple about us page.
  end

  
  def healthz
    render json: {
      status: 200,
      message: "It's ALIVE"
    }.to_json
  end
end
