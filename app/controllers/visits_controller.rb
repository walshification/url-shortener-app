class VisitsController < ApplicationController
  def create
    @visit = Link.find_by(:slug => params[:slug])

    if @link
      @link.visits.create(:ip_address => request.remote_ip)
      redirect_to "http://#{@link.target_url}"
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
