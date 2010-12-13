class LandingController < ApplicationController
	layout 'application'
  def menu_one
    render :partial => "menu1"
  end 
  
  def menu_two
    render :partial => "menu2"
  end
  def menu_three
    render :partial => "menu3"
  end
end
