class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
	  end


	protected
	   	def authenticate_user!
	     	if user_signed_in?
	       		super
	       		# redirect_to products_path
	     	else
	       		redirect_to home_index_path, :notice => 'if you want to add a notice'
	       		## if you want render 404 page
	       		## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
	     	end
	   end

	   def after_sign_in_path_for(resource)
	     if current_user
	       products_path
	     
	     end
	   end

end
