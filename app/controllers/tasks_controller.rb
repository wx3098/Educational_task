class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy]
  def new
    @task = Task.new
  end

  def index

    if params[:sort_expired].present?
      @tasks = Task.all.order(termination_date: "DESC").page(params[:page]).per(10)
      # elsif params[:sort_status]
      #   @tasks = @tasks.order(status: :asc)
    else
      @tasks = Task.all.order(created_at: "DESC").page(params[:page]).per(10)
    end


    if params[:sort_priority].present?
      @tasks = Task.all.order(priority: "ASC").page(params[:page]).per(10)
    # else
    #   @tasks = Task.all.order(created_at: "DESC").page(params[:page]).per(10)
    end

    if params[:task].present?
      if params[:task][:name].present? && params[:task][:status].present?
        @tasks = @tasks.name_search(params[:task][:name]).status_search(params[:task][:status]).page(params[:page]).per(10)
      elsif params[:task][:name].present?
        @tasks = @tasks.name_search(params[:task][:name]).page(params[:page]).per(10)
      elsif params[:task][:status].present?
        @tasks = @tasks.status_search(params[:task][:status]).page(params[:page]).per(10)
      else
        @tasks =  Task.all.page(params[:page]).per(10)
      end
    end
  end
def create
    @task = current_user.tasks.build(task_params)
      if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path
        flash[:notice] = "作成しました"
      else
        render :new
      end
    end
  end 
    
  def show
    Task.find(params[:id]) 
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
      flash[:notice] =  "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
    flash[:notice] = "削除しました"
  end

  def confirm
    @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)
    render :new if @task.invalid?
  end

  private

  def task_params
    params.require(:task).permit(:name, :detail, :termination_date, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

