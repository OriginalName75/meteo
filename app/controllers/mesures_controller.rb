require 'httparty'
class String
  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end
end

class MesuresController < ApplicationController
  def myown

  end

  def index
    
      
     
     
     
    
    if (params.has_key?(:y) and params.has_key?(:m) and params.has_key?(:d) and params[:y].is_i? and params[:m].is_i? and params[:d].is_i? )
      puts DateTime.new(params[:y].to_i,params[:m].to_i,params[:d].to_i)
      @date = Date.new(params[:y].to_i,params[:m].to_i,params[:d].to_i)
      @mesures = Mesure.where("t >= ?", @date).where("t < ?", DateTime.new(params[:y].to_i,params[:m].to_i,params[:d].to_i)+1 ).pluck(:t, :temperature) 
      
    else
      @mesures = Mesure.all.pluck(:t, :temperature) 
      @date = Date.today
    end

  end

  def postH

    redirect_to "/mesures/"+ params[:start_date][:year].to_s+ "/"+params[:start_date][:month].to_s+ "/"+params[:start_date][:day].to_s

  end

  def generator
    Mesure.delete_all
    prng = Random.new
    avant=0
    deg=20
    for i in 0..1439

      date=DateTime.new(2016, 10,31, (i/60).floor, i%60, 35)
      l=Mesure.new
      l.t=date

      r=prng.rand(30)
      if r<10
        plus=avant
      elsif r<20
        plus=0
      elsif r<25
        plus=0.1
      else
        plus=-0.1

      end
      avant=plus
      deg=deg+plus
      l.temperature=deg
      l.lieu_id=Lieu.first.id
      l.save
    end
    @mesures = Mesure.all
  end

  def completed_tasks
    render json: Lieu.group_by_day(:completed_at).count
  end
end
