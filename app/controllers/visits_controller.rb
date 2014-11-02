class VisitsController < ApplicationController
  def create
    @visit = Link.find_by(:slug => params[:slug]).visits.create(:ip_address => request.remote_ip)
    redirect_to "http://#{@link.target_url}"
  end
end
