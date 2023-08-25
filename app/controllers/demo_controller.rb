class DemoController < ApplicationController
  layout 'application'
  def index
    render('index')
  end

  def hello
    @array=[1,2,3,4]
    @id=params['id']
    @page=params[:page]
    render('hello')
  end
  def other_hello
    redirect_to(:action=>'index')
  end
  def facebook
    redirect_to('https://www.facebook.com')
  end
  def escape_output
  end

  def about
    render("about_us")
  end

  def contact
    render("contact_us")
    @country=params[:country] 
  end
end
  