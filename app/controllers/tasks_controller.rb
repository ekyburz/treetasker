class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_assignees, only: %i[new edit]

  # GET /tasks or /tasks.json
  def task_do
    @tasks = Task.where(priority: 1, deleted: false)
  end

  def task_decide
    @tasks = Task.where(priority: 2, deleted: false)
  end

  def task_delegate
    @tasks = Task.where(priority: 3, deleted: false)
  end

  def task_depository
    @tasks = Task.where(priority: 4, deleted: false)
  end

  def index
    # @tasks = Task.all
    @tasks_by_priority = Task.all.order(:priority).group_by(&:priority)
  end

  # GET /tasks/1 or /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
    @task.creator = current_user
    @task.assignee = current_user
  end

  # GET /tasks/1/edit
  def edit; end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.update(deleted: true)

    respond_to do |format|
      if @task.save
        format.html { redirect_to archive_path, notice: 'Task was successfully deleted.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def set_assignees
    @assignees = User.all
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :details, :priority, :deadline, :completed, :creator_id, :assignee_id, :deleted)
  end
end
