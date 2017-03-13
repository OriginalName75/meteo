require "Wheater.rb"

class String
  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end
end

class AjaxLieuController < ApplicationController
  def lieu
    if !params.has_key?(:l) || !params[:l].is_i?
      redirect_to "/"
      return 0

    end
    if !params.has_key?(:i)
      prammm = 0
    else
      if !params[:i].is_i?
        redirect_to "/"
        return 0
      end
      prammm= params[:i].to_i

    end

    idd = params[:l].to_i
    pr=Lieu.where(id: idd)

    if pr.empty?
      redirect_to "/"
      return 0
    end

    @lieu = Lieu.find(idd)
    @result=""

    if prammm==2
      @Nom="Humidité (%)"
      @color="rgba(0,0,179,1)"
      @colorP="rgba(120,0,0,1)"
      @colorB="rgba(199,100,100,0.2)"
      @colorO="#00a"
    elsif prammm==1
      @Nom="Vitesse du vent (m/s)"
      @color="rgba(180,180,179,1)"
      @colorP="rgba(120,120,120,1)"
      @colorB="rgba(100,100,100,0.2)"
      @colorO="#777"
    elsif prammm==3
      @Nom="Pression"
      @color="rgba(20,20,20,1)"
      @colorP="rgba(120,120,120,1)"
      @colorB="rgba(10,10,10,0.2)"
      @colorO="#777"
    elsif prammm==4
      @Nom="Nebulosité (%)"
      @color="rgba(120,120,120,1)"
      @colorP="rgba(20,20,20,1)"
      @colorB="rgba(10,10,10,0.2)"
      @colorO="#222"
    else
      @Nom="Tempérture (°C)"
      @color="rgba(179,0,0,1)"
      @colorP="rgba(90,0,0,1)"
      @colorB="rgba(199,100,100,0.2)"
      @colorO="#a00"

    end
    if !@lieu.openW.nil?

      url = 'http://api.openweathermap.org/data/2.5/forecast?id='+ @lieu.openW.to_s+'&APPID=f0b649bd38a937e091091572ae3b2d62'
      @result = HTTParty.get(url)
      @result.parsed_response
      @listT="["
      @listTemp="["
      @listJ="["
      @listJ2="["
      @pluss="["
      iii=0
      lastW=-1
      jjj=0
      kkk=0
      @leng=@result["list"].size
      @result["list"].each do |l|

        if iii!=0
          @listT=@listT+","
          @listTemp=@listTemp+","
          if prammm==0
            @pluss=@pluss+","
          end
        end
        iii=iii+1
        t= Time.at(l["dt"].to_i)
        if t.wday==0
          strrr="Lundi"
        elsif t.wday==1
          strrr="Mardi"
        elsif t.wday==2
          strrr="Mercredi"
        elsif t.wday==3
          strrr="Jeudi"
        elsif t.wday==4
          strrr="Vendredi"
        elsif t.wday==5
          strrr="Samedi"
        else
          strrr="Dimanche"
        end
        if lastW != t.wday
          if jjj!=0
            @listJ2=@listJ2+","
          end
          if  lastW !=-1
            if kkk!=0
              @listJ=@listJ+","
            end
          end

          @listJ2=@listJ2+"'"+strrr+"'"
          if  lastW !=-1
            @listJ=@listJ+(iii-1).to_s
            kkk=1
          end
          jjj=1
        end
        lastW=t.wday

        strrr=(t.hour).to_s+"h"
        @listT= @listT+"\""+strrr+"\""
        w = Wheater.new(l["weather"][0]["icon"],"","","")

        if prammm==0
          @pluss= @pluss+w.ajaxI
        end

        if prammm==2
          vall=l["main"]["humidity"]
        elsif prammm==1
          vall=l["wind"]["speed"]
        elsif prammm==3
          vall=l["main"]["pressure"]
        elsif prammm==4
          vall=l["clouds"]["all"]
        else
          vall=l["main"]["temp"]-273
        end

        @listTemp= @listTemp+((((vall)*100).floor)/100.0).to_s

      end
      @listT=@listT+"]"
      @listTemp=@listTemp+"]"
      @listJ=@listJ+"]"
      @listJ2=@listJ2+"]"

      @pluss=@pluss+"]"

    end

    render :layout => false
  end

  def meteo

    if !params.has_key?(:l) || !params[:l].is_i?
      redirect_to "/"
      return 0

    end
    idd = params[:l].to_i
    if Lieu.where(id: idd).empty?
      redirect_to "/"
      return 0
    end
    @lieu = Lieu.find(idd)
    @iddd=idd
    @result=""
    @isopen=false
    if !@lieu.openW.nil?
      @isopen=true
      url = 'http://api.openweathermap.org/data/2.5/weather?id='+ @lieu.openW.to_s+'&APPID=f0b649bd38a937e091091572ae3b2d62'
      @result = HTTParty.get(url)
      @result.parsed_response
      w = Wheater.new(@result["weather"][0]["icon"],@result["main"]["temp"],@result["main"]["humidity"],@result["wind"]["speed"])
      puts @result["wind"]
      @descAngle=@result["wind"]["deg"].to_s
      puts @result["main"]["temp"]
      @imgWea="meteo/"+w.img
      @descWea=w.desc
      @tempe=w.tempe
      @imgtempe=w.imgtempe
      @pression=@result["main"]["pressure"]
      @w=w
      @cloudness=@result["clouds"]["all"]

    else
      mesure=Mesure.where(lieu_id: idd).order(:t).last
      @w = Wheater.new("",mesure.temperature,mesure.humidite,mesure.vitessevent)
      @pression=mesure.pression
      if not mesure.temperature.nil?
        @tempe=@w.tempe
        @imgtempe=@w.imgtempe
      end
      @user=mesure.rasb_sec.user
      time2 = Time.now
      @modif=time2 - mesure.t
      
      @modif= (@modif/60).to_i
      @modifi=1
    end
    render :layout => false
  end
end
