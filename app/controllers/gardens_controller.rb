class GardensController < ApplicationController
  def index
    @user = current_user
    @garden = @user.garden
  end
end
