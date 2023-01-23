class FirstController < ApplicationController
  skip_before_action  :authorize
  skip_before_action  :authorize_user
  def index
  end
end
