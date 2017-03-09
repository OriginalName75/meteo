class AjaxUserController < ApplicationController
  autocomplete :user, :email, :extra_data => [:id]
  before_action :authenticate_user!

  def changeImg
    pn = Pathname.new(current_user.avatar.path(:original))
    ln= Pathname.new(current_user.avatar.path(:large))
    @e=ln.exist? && pn.exist?
    render :layout => false
  end

  def changeAutre

    if current_user.affichage==0
      @init="Afficher mon nom d'utilisateur uniquement"
    elsif current_user.affichage==1
      @init="Afficher mon nom et prenom uniquement"
    else
      @init="Afficher mon mon d\'utilisateur puis mon nom et prenom"
    end
    render :layout => false
  end

  def cropImg
    if !current_user.isAdmin
      redirect_to '/'
      return 0
    end
    @rasb=Rasb.new
    render :layout => false
  end

  def updateRasb
    if !current_user.isAdmin
      redirect_to '/'
      return 0
    end

    @rasb = Rasb.new
    li=params[:rasb]

    redirect_to "/myspace/myown"

  end

  def updateParams
    @user = current_user
    li=params[:user][:affichage]

    if li.include? "Afficher mon nom d'utilisteur uni"
      params[:user][:affichage]=0
    elsif li.include? "Afficher mon nom et prenom uni"
      params[:user][:affichage]=1
    else
      params[:user][:affichage]=2
    end
    if @user.update_attributes(params[:user].permit(:nom, :prenom, :username,:affichage,:affichageMail,:affichageNomPrenom))
      flash[:notice] = ActionController::Base.helpers.image_tag("good.png", :width => "100px")+ "Vous avez changé votre profile."
    end
    redirect_to "/myspace/myown"
  end

  def update

    @user = current_user

    if @user.update_attributes(params[:user].permit(:avatar,:crop_x, :crop_y, :crop_w, :crop_h, :nom, :prenom, :username))
   
      if @user.cropping?
        @user.avatar.reprocess!
      end

      flash[:notice] = ActionController::Base.helpers.image_tag("good.png", :width => "100px")+ "Vous avez changé votre avatar."
      if params[:user][:avatar].blank?
        redirect_to "/myspace/myown"
      else

        redirect_to "/myspace/myown"
      end
    else
      redirect_to "/myspace/myown"
    end

  end

end
