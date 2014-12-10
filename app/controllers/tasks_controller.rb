class TasksController < ApplicationController
  # GET /tasks
  def index
  	if params[:show_completed] == "1"
	    @tasks = Task.all
	else
		@tasks = Task.where("completed = ?", false)
	end
  end

  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
    	#successful save
      redirect_to @task
    else
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
    else
      render "edit"
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

 def task_params
    params.require(:task).permit(:name, :notes, :due_date, :completed)
  end

end
