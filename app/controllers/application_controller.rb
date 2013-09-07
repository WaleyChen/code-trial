class ApplicationController < ActionController::Base
  protect_from_forgery

  def landing
    @bg = true
  end
end
