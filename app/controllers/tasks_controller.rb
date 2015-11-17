class TasksController < ApplicationController
  before_filter :last_page

  def index
    @tasks = Task.all
  end

  def show
    id = params[:id]
    @task = Task.find(id)
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params[:task])
    redirect_to "/"
  end

  def edit
    id = params[:id]
    @task = Task.find(id)
  end

  def update
    id = params[:id]
    @task = Task.find(id)
    @task.update(
      name: task_params[:task][:name],
      description: task_params[:task][:description],
      person_id: task_params[:task][:person_id]
      )
    redirect_to "/"
  end

  def complete
    id = params[:id]
    @task = Task.find(id)
    @task.update(completed: Time.now)
    redirect_to "/tasks/#{id}"
  end

  def destroy
    id = params[:id]
    Task.destroy(id)
    redirect_to "/"
  end

  private

  def task_params
    params.permit(task:[:name, :description, :completed, :person_id])
  end

  def last_page
    session[:last_page] = request.env['HTTP_REFERER']
  end

end
