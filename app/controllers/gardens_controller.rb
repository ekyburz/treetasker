class GardensController < ApplicationController
  def index
    @user = current_user
    @garden = @user.garden
    date_filter = params[:date_filter]

    case date_filter
    when 'Day'
      start_date = Date.today.beginning_of_day
      end_date = Date.today.end_of_day
    when 'Week'
      start_date = Date.today.beginning_of_week
      end_date = Date.today.end_of_week
    when 'Month'
      start_date = Date.today.beginning_of_month
      end_date = Date.today.end_of_month
    when 'Year'
      start_date = Date.today.beginning_of_year
      end_date = Date.today.end_of_year
    else
      start_date = nil
      end_date = nil
    end
    @filtered_tasks = @garden.trees.where(created_at: start_date..end_date)
  end
end
