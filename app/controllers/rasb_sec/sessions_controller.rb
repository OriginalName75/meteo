class RasbSec::SessionsController < Devise::SessionsController
  prepend_before_action :allow_params_authentication!, only: :create
  prepend_before_action :verify_signed_out_user, only: :destroy
  prepend_before_action only: [:create, :destroy] { request.env["devise.skip_timeout"] = true }
  skip_before_action :verify_authenticity_token
  # GET /resource/sign_in
  def new

    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create

    self.resource = warden.authenticate!(auth_options)

    if !params["rasb_sec"]["temp"].nil? && (params["rasb_sec"]["temp"].is_a?(Numeric) )
      ong=params["rasb_sec"]["long"]
      at=params["rasb_sec"]["lat"]
      if current_rasb_sec.lieu.nil?

        position= [at, ong]
        l=Lieu.near(position, 20, :units => :km)

        min=-1
        minnn=0
        findd=false
        l.each do |ll|
          d=ll.distance_from(position)
          if min==-1 || d<min
            min=d
            minnn=ll
            findd=true
          end

        end
        if !findd
          l=Lieu.new
          l.longitude=ong
          l.latitude=at
          l.save

          l.nom=l.address
          l.save
          current_rasb_sec.lieu_id=l.id
          current_rasb_sec.save
         
        else
          current_rasb_sec.lieu_id=minnn.id
          current_rasb_sec.save
        
        end

      else
        position= [at, ong]
        l=current_rasb_sec.lieu
        dd= l.distance_from(position)
       
        if dd>1
          l=Lieu.new
          l.longitude=ong
          l.latitude=at
          l.save

          l.nom=l.address
          l.save
          current_rasb_sec.lieu_id=l.id
          current_rasb_sec.save
        

        end

      end

      a=Mesure.create(temperature: params["rasb_sec"]["temp"],vitessevent: params["rasb_sec"]["vitessevent"],humidite: params["rasb_sec"]["humidite"],pression: params["rasb_sec"]["pression"], rasb_sec_id: current_rasb_sec.id, lieu_id:  current_rasb_sec.lieu.id)
      puts a.errors.messages
    end

    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    destroy

  end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    redirect_to "/rasb_pi/se"
  end

  protected

  def sign_in_params

    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password])
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end

  def auth_options

    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  def translation_scope
    'devise.sessions'
  end

  private

  # Check if there is no signed in user before doing the sign out.
  #
  # If there is no signed in user, it will set the flash message and redirect
  # to the after_sign_out path.
  def verify_signed_out_user
    if all_signed_out?
      set_flash_message! :notice, :already_signed_out

      respond_to_on_destroy
    end
  end

  def all_signed_out?
    users = Devise.mappings.keys.map { |s| warden.user(scope: s, run_callbacks: false) }

    users.all?(&:blank?)
  end

  def respond_to_on_destroy
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end

end
