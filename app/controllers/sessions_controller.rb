class SessionsController < Devise::SessionsController
  before_filter :set_class, :remove_history

  private
  
  def set_class
    @bodyclass = "user"
  end
  
  def remove_history
    cookies[:history] = ""
  end
end