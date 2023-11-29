class GardensController < ApplicationController
  def show
    @user = current_user
    @garden = @user.garden
  end
end
