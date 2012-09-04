class MainController < ApplicationController
  before_filter :login_required
  def index
  	if request.user_agent =~ /Mobile|webOS/
      redirect_to "/mobile"
    end
  end

end
