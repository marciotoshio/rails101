class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_user
    User.find_or_create_by(email: 'user@email.com')
  end
end
