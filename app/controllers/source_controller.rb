  require 'json'
require "Wheater.rb"
class SourceController < ApplicationController
  autocomplete :lieu, :nom, :extra_data => [:id]
  def proxi
   
    
    redirect_to "/lieux/"+params[:lieu_id].to_s
  end
  def new
    if current_user
      @abo=current_user.lieus
       if @abo.size>0
         redirect_to "/follow/source"
            
         return 0
       end
   
    end  
#    @position=request.location.coordinates
    @position= [48.114722, -1.679444]
    l=Lieu.near(@position, 100, :units => :km)  
    
    min=-1
    @minnn=0
    @findd=false
    l.each do |ll|
      d=ll.distance_from(@position)
      if min==-1 || d<min
        min=d
        @minnn=ll
        @findd=true
      end
      
    end
      
    @users = Lieu.all

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.json({ link: ("/lieux/"+ user.id.to_s)})
      marker.infowindow user.nom

    end
   
  end

  def create
    co=0
    Lieu.delete_all
    file = File.read('/home/originalname/myapp/city.list.json')
    file.gsub!(/\r\n?/, "\n")
    file.each_line do |line|
      data_hash = JSON.parse(line)
      if data_hash["country"].eql?  "FR"
        if co==700
          co=-1
          @lieu=Lieu.new
          @lieu.address=data_hash["name"]
          @lieu.nom=data_hash["name"]
          @lieu.latitude=data_hash["coord"]["lat"]
          @lieu.longitude=data_hash["coord"]["lon"]
          @lieu.openW= data_hash["_id"] 
          @lieu.save
         
        end
        co=co+1

      end
    end

  end
end
