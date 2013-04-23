class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'fluid_right_navigation'

  def page_title
    'My Tityle'
  end
end
