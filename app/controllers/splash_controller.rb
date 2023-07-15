class SplashController < ActionController::Base
  layout 'application'
  def index
    if current_user
      redirect_to groups_path
    else
      render 'splash'
    end
  end
end
