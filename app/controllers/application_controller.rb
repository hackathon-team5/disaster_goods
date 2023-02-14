class ApplicationController < ActionController::Base
  
  private

  def not_authenticated
    redirect_to main_app.login_path
  end
end
