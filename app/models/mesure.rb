class Mesure < ActiveRecord::Base
  belongs_to :lieu, optional: true
  belongs_to :rasb_sec, optional: true
  belongs_to :user, optional: true
  
  before_create :set_foo_to_now
  def set_foo_to_now
    self.t = Time.now
  end
  validates :temperature, presence: {

    message: "La temp doit être renseigné."

  }

end