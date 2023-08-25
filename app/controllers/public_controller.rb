class PublicController < ApplicationController
  before_action :setup_navigation
  def index
  end

  def show
    @page=Page.visible.where(:permslinks=>params[:permalinks]).first
    if @page.nil?
      redirect_to(root_path)
    else
      #shows the content in show.html page
  end
end

  private
  def setup_navigation
    @subjects=Subject.visible.sorted
  end
end
