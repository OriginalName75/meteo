class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :mesure
  has_many :rasb_sec
  has_and_belongs_to_many :lieus, join_table: "users_lieus"
  has_attached_file :avatar, styles: { :small => "100x100#", :large => "500x500>" }, default_url: "user.png", :processors => [:cropper]
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  


  def cropping?
    
   
    return !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}

    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end

  private

 

end
