class TasksController < ApplicationController
    before_action :set_task, only: [ :show, :edit, :update, :destroy]
    def index
      @tasks = Task.all.order(created_at: "DESC")
    end
    
    def new
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
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
      render :new if @task.invalid?
    end

    private

    def task_params
        params.require(:task).permit(:name, :detail)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
