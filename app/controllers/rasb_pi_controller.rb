class RasbPiController < ApplicationController
  def all
    @rasb=RasbSec.all
  end

  def se
    
 
    render :layout => false


  end
end
