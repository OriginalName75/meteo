class String
  def is_i?
    !!(self =~ /\A[-+]?[0-9]+\z/)
  end
end

class FollowController < ApplicationController
  before_action :authenticate_user!
  def source
    @lieux=current_user.lieus

    if @lieux.size==0
      redirect_to "/"
    end
  end

  def foll
    if !params.has_key?(:l) || !params[:l].is_i?
      redirect_to "/"
      return 0

    end

    idd = params[:l].to_i
    @lieu=Lieu.where(id: idd)
    current_user.lieus << @lieu

    redirect_to "/follow/source"
    return 0

  end

  def unfoll
    if !params.has_key?(:l) || !params[:l].is_i?
      redirect_to "/"
      return 0

    end

    idd = params[:l].to_i
    @lieu=Lieu.where(id: idd)
    current_user.lieus.delete(@lieu)
    redirect_to "/follow/source"
    return 0
  end
end
