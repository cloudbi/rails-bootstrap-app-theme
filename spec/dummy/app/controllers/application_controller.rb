class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'fluid_right_sidebar'

  def page_title
    'Rails Bootstrap App Theme'
  end
end
