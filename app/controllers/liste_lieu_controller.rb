class ListeLieuController < ApplicationController
  autocomplete :lieu, :nom, :extra_data => [:id]

  def all

    @users = Lieu.all

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.json({ link: ("/lieux/"+ user.id.to_s)})
      marker.infowindow user.nom
    end
  end
end
