class AdminController < ApplicationController
  def login
  end

  def check
  	if params[:password] == ENV['admin_pass']
  		session[:admin] = true
  		redirect_to registrations_path
  	else
  		redirect_to login_admin_path
  	end
  end
end
