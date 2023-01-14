class TasksController < ApplicationController
    before_action :set_task, only: [ :show, :edit, :update, :destroy]
    def index
      if params[:tasks].present? 
       if @tasks = Task.where(params:[:name]).where(params:[:status])
       elsif
          @tasks = Task.where(params:[:name]) 
       elsif
          @tasks = Task.where(params:[:status])
       end
      end
      @tasks = Task.all.order(created_at: "DESC")
      if params[:sort_expired]
        @tasks = Task.all.order(termination_date: "DESC")
      else
        @tasks = Task.all
      end
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
        params.require(:task).permit(:name, :detail, :termination_date, :status)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
