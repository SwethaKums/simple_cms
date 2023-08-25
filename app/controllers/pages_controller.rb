class PagesController < ApplicationController
  layout 'admin'
  before_action :confirm_logged_in

  before_action :find_subjects , :only=>[:new,:create,:update, :edit]
  before_action :set_page_count , :only=>[:new,:create,:edit,:update]
  def index
    @pages=Page.all
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
    @page=Page.new
    
  end

  def create
    @page=Page.new(page_params)
    if @page.save
      flash[:notice]="page created sucessfully "
      redirect_to(pages_path)
    else
     
      render('new')
  end
end

  def edit  
    @page=Page.find(params[:id])
  end

  def update
    @page=Page.find(params[:id])
    if @page.update(page_params)
      flash[:notice]="page updated successfully"
      redirect_to(page_path(@page))
    else
      
      
      render("edit")
  end
end

  def delete
    @page=Page.find(params[:id])
  end

  def destroy
    @page=Page.find(params[:id])
    if @page.destroy
      flash[:notice]="page with the name #{@page.name} deleted successfully "
      redirect_to(pages_path)
  end
end

  private
  def page_params
    params.require(:page).permit(:subject_id,:name,:position,:permalinks,:visible)
  end

  def find_subjects
    @subjects=Subject.sorted
  end

  def set_page_count
     @page_count=Page.count
     if params[:action]== 'new' || params[:action]== 'create'
      @page_count=Page.count+1
    end
  end
end
