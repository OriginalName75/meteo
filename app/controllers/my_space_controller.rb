class String
  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end
end

class MySpaceController < ApplicationController
 
  def myown
    @other=false

    if params[:l] && params[:l].is_i?
      @other=true
      idd = params[:l].to_i
      pr=User.where(id: idd)

      if pr.empty?
        redirect_to "/"
        return 0
      end
      @user=pr[0]
    else
      if not user_signed_in?
        redirect_to "/"
      end 
      @user=current_user
    end

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
