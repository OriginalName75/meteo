require "Wheater.rb"

class String
  def is_i?
    /\A[-+]?\d+\z/ === self
  end
end

class LieuxController < ApplicationController
  def index
    if !params.has_key?(:l) || !params[:l].is_i?
      redirect_to "/"
      return 0

    end
    idd = params[:l].to_i
    if Lieu.where(id: idd).size==0
      redirect_to "/"
      return 0
    end
    @lieu = Lieu.find(idd)

    @isopen=false
    if !@lieu.openW.nil?
      @isopen=true
    end
  end
end
