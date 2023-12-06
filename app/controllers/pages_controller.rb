class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :team, :pricing]

  def home
    @user = current_user
    return unless @user

    @garden = @user.garden
    @tasks_p1 = Task.where(priority: 1, completed: false, creator: current_user).limit(4).order(:created_at)
    @tasks_p2 = Task.where(priority: 2, completed: false, creator: current_user).limit(4).order(:created_at)
    @tasks_p3 = Task.where(priority: 3, completed: false, creator: current_user).or(Task.where(priority: 3, completed: false, assignee: current_user)).limit(4).order(:created_at)
    @tasks_p4 = Task.where(priority: 4, completed: false, creator: current_user).limit(4).order(:created_at)
  end

  def profile
    @user = current_user
  end

  def archive
    @user = current_user
    @tasks_by_priority = Task.where(completed: true, deleted: false, creator: current_user).order(:priority).group_by(&:priority)
  end

  def about; end

  def team; end

  def pricing; end
end
