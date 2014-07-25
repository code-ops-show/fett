class DashboardController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@resume = User.find(current_user.id).resume
  end
  
end
