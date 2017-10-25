class Admin::HomeController < Admin::ApplicationController

	def login
		respond_to do |format|
			format.html { render layout: false }
		end
	end

	def index
	end
end
