class Admin::ApplicationController < ActionController::Base
	layout 'admin_application'
	protect_from_forgery with: :exception
	before_action :check_admin_login, :except => [:login, :login_auth]

	private
		def check_admin_login
			unless session[:user_id].blank?
				@user = User.find(session[:user_id])
			else
				redirect_to '/admin/login'
			end
		end

		def check_access!
			unless @user.user_role_id.blank?
				if @user.user_role_id == 2
					redirect_to '/admin/orders/new'
				end
			end
		end


end
