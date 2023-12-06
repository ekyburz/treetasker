class GardensController < ApplicationController
  def index
    @user = current_user
    @garden = @user.garden
    date_filter = params[:date_filter]

    case date_filter
    when 'All Time'
      start_date = nil
      end_date = nil
      date_range_text = 'all time'
    when 'Week'
      start_date = Date.today.beginning_of_week
      end_date = Date.today.end_of_week
      date_range_text = 'week'
    when 'Month'
      start_date = Date.today.beginning_of_month
      end_date = Date.today.end_of_month
      date_range_text = 'month'
    when 'Year'
      start_date = Date.today.beginning_of_year
      end_date = Date.today.end_of_year
      date_range_text = 'year'
    else
      start_date = Date.today.beginning_of_day
      end_date = Date.today.end_of_day
      date_range_text = 'today'
    end

    @filtered_tasks = @garden.trees.where(created_at: start_date..end_date)
    @date_range_text = date_range_text
  end
end
