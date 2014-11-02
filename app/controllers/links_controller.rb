class LinksController < ApplicationController
  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(params[:link])
    @link.standardize_target_url!

    if @link.save
      flash[:success] = "Link successfully created!"
      redirect_to links_path
    else
      render 'new'
    end
  end

  def show
    @link = Link.find_by(:id => params[:id])
  end
end
