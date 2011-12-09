class ApplicationController < ActionController::Base
  require 'authenticated_system'
  include AuthenticatedSystem
  protect_from_forgery
end
