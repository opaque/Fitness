class LandingController < ApplicationController
	layout 'application'
  def menu_one
    render :partial => "menu_one"
  end 
  
  def menu_two
    render :partial => "menu_two"
  end
  def menu_three
    render :partial => "menu_three"
  end
end
