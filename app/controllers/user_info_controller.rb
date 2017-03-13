class String
  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end
end

class UserInfoController < ApplicationController
  def mini
    if params[:l].is_i?
      idd = params[:l].to_i
      pr=User.where(id: idd)

      if pr.empty?
        redirect_to "/"
        return 0
      end
      @user=pr[0]
    
      if @user.affichage==0
        if @user.username
          @init=@user.username
          
        end
        
        
      elsif @user.affichage==1
        if @user.nom and @user.prenom
          @init=@user.nom + " " + @user.prenom
        end
        
      else
        if @user.nom and @user.prenom and @user.username
          @init=@user.username + " ("+@user.nom + " " + @user.prenom+")"
        end
        
      end
    else
      redirect_to "/"
      return 0
    end
    render :layout => false
  end

  def normal

    render :layout => false
  end
end
