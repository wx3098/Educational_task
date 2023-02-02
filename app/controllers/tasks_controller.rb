class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy]
  def new
    @task = Task.new
  end

  def index
    @tasks = current_user.tasks.order(created_at: "DESC").page(params[:page]).per(10)
    if params[:sort_expired].present?
      @tasks = @tasks.order(termination_date: "DESC")
    end

    if params[:sort_priority].present?
      @tasks = @tasks.order(priority: "ASC")
    # else
    #   @tasks = Task.all.order(created_at: "DESC")
    end

    if params[:task].present?
      if params[:task][:name].present? && params[:task][:status].present?
        @tasks = @tasks.name_search(params[:task][:name]).status_search(params[:task][:status])
      elsif params[:task][:name].present?
        @tasks = @tasks.name_search(params[:task][:name])
      elsif params[:task][:status].present?
        @tasks = @tasks.status_search(params[:task][:status])
      elsif params[:task][:label_id].present?
        @tasks = @tasks.where(id: Labelling.where(label_id: params[:task][:label_id]).pluck(:task_id))

      else
        @tasks
      end
    end
  end

def create
    @task = current_user.tasks.build(task_params)
      if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path(@task)
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
    params.require(:task).permit(:name, :detail, :termination_date, :status, :priority, { label_ids: [] })
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
