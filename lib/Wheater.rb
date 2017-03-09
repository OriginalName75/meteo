class Wheater
  def initialize(stri, tempe, humi, windS)
    if (stri.eql? "01d") || (stri.eql? "01n")
      @img="01d.png"
      @ajaxI="Sol"
      @desc="Soleil"
    elsif (stri.eql? "02d") || (stri.eql? "02n")
      @img="02d.png"
      @desc="Quelques nuages"
      @ajaxI="NuaQ"
    elsif (stri.eql? "03d") || (stri.eql? "03n")
      @img="03d.png"
      @desc="Nuages"
      @ajaxI="Nua"
    elsif (stri.eql? "04d") || (stri.eql? "04n")
      @img="04d.png"
      @desc="Nuages denses"
      @ajaxI="NuaD"
    elsif (stri.eql? "09d") || (stri.eql? "09n")
      @img="09d.png"
      @desc="Nuages denses et pluie"
      @ajaxI="NuaDP"
    elsif (stri.eql? "10d") || (stri.eql? "10n")
      @img="10d.png"
      @desc="Pluie"
      @ajaxI="Pluie"
    elsif (stri.eql? "11d") || (stri.eql? "11n")
      @img="11d.png"
      @desc="Tempête"
      @ajaxI="Temp"
    elsif (stri.eql? "13d") || (stri.eql? "13n")
      @img="13d.png"
      @desc="Neige"
      @ajaxI="Neige"
    elsif (stri.eql? "50d") || (stri.eql? "50n")
      @img="50d.png"
      @desc="Brume"
      @ajaxI="Brume"
    end
    if tempe.to_i<=100
      @tempe=(((tempe.to_i)*100).floor)/100.0
    else
      @tempe=(tempe.to_i-273.15).round
    end

    @humiImg

    if not humi.nil?
      @humi=humi.to_i
      if  @humi<40
        @humiImg="meteo/dry.png"
        @humidescr="L'air est sec"
      elsif @humi>60
        @humiImg="meteo/hum.png"
        if @humi>80
          @humidescr="L'air est très humide"
        else
          @humidescr="L'air est humide"
        end

      else
        @humiImg="meteo/humnorm.png"

        @humidescr="L'air a une humidité normale"
      end
    end
    if @tempe<10
      @imgtempe="froid.png"
    elsif @tempe>24
      @imgtempe="chaud.png"
    else
      @imgtempe="normal.png"
    end

    @windS=windS.to_i

    if @windS<0.2
      @windDesc="Calme"
      @windImg="no.png"
    elsif @windS<1.5
      @windDesc="<b>Vent très léger</b>. Pas de ressenti sur la peau. "
      @windImg="no.png"
    elsif @windS<3.4
      @windDesc="<b>Brise légère</b>. Vent ressenti sur la peau."
      @windImg="no.png"
    elsif @windS<5.4
      @windDesc="<b>Vent léger</b> et ressenti sur la peau. Les feuilles sont en mouvement constant."
      @windImg="petit.png"
    elsif @windS<7.9
      @windDesc="<b>Vent modéré</b> et ressenti sur la peau. Les feuilles sont en mouvement constant. Les petites branches commencent à se déplacer. Des petites vagues commencent à se former en mer"
      @windImg="petit.png"
    elsif @windS<10.7
      @windDesc="<b>Vent un peu fort</b>. Les branches de taille moyenne et les petits arbre commencent à se balancer. Des vagues de taille moyenne commencent à se former en mer"
      @windImg="petit.png"
    elsif @windS<13.8
      @windDesc="<b>Vent fort</b>. Les grandes branches commencent à se déplacer. Le vent émet un sifflement. L'utilisation d'un parapluie devient difficile. Les poubelles de plastique vides se renversent. Des grandes vagues commencent à se former en mer"
      @windImg="petit.ico"
    elsif @windS<17.1
      @windDesc="<b>Leger coups de vent</b>. Les arbres sont en mouvement. Des effort sont nécessaire pour marcher contre le vent. Des grandes vagues commencent à se former en mer"
      @windImg="petit.ico"
    elsif @windS<20.7
      @windDesc="<b>Coups de vent</b>. Les arbres sont en mouvement et des brindilles se cassent sur ces arbres. Des effort sont nécessaire pour marcher contre le vent. Les voitures tournent par la force du vent sur les routes. Des vagues modérement haute commencent à se former en mer"
      @windImg="petit.ico"
    elsif @windS<24.4
      @windDesc="<b>Grand coups de vent</b>. Des grandes branches se brisent dans les arbres. Attention aux tentes . Des effort sont nécessaire pour marcher contre le vent.  Des grandes vagues haute commencent à se former en mer"
      @windImg="petit.ico"
    elsif @windS<28.4
      @windDesc="<b>Tempête</b>. Certain arbres peuvent être arrachés ou déracinés, certain jeunes arbres fléchis ou déformés. En mer les Vagues sont très élevées avec de longues crêtes suspendues et la visibilité est affectée. "
      @windImg="atten.png"
    elsif @windS<32.6
      @windDesc="Grosse tempête ! "
      @windImg="atten.png"
    else
      @windDesc="Ouragan "
      @windImg="temp.png"

    end
  end

  def windImg
    @windImg

  end

  def windDesc
    @windDesc

  end

  def windS
    @windS

  end

  def humidescr
    @humidescr

  end

  def humi
    @humi

  end

  def humiImg
    @humiImg

  end

  def tempe
    @tempe

  end

  def imgtempe
    @imgtempe

  end

  def img
    @img

  end

  def ajaxI
    @ajaxI
  end

  def desc
    @desc
  end
end