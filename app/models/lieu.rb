class Lieu < ActiveRecord::Base
  has_many :mesure
  # with an attributes
  geocoded_by :address # address is an attribute of MyModel

  
  # the callback to set longitude and latitude
  after_validation :geocode
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  has_many :rasb_sec
  has_and_belongs_to_many :users, join_table: "users_lieus"
  def self.search(term)
    where('LOWER(nom) LIKE :term', term: "%#{term.downcase}%")
  end
end