class MySpaceController < ApplicationController
  before_action :authenticate_user!
  def myown

    @mesure = Mesure.new
    @mesures=Mesure.where(user_id: current_user.id)
  
  end
 
  def create
    
    puts params[:temperature]
    a=Mesure.create(temperature: params[:temperature], lieu: Lieu.find(1), user_id: current_user.id)
    puts a.errors.messages  
    
    puts a.t
    
    puts params[:temperature]
    redirect_to "/myspace/myown"
  end
end
