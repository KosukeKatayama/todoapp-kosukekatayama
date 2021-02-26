class TasksController < ApplicationController

    def index
        @tasks = Task.all
        @board = Board.find(params[:board_id])
    end

    def new
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to board_tasks_path, notice: '保存されました'
        else
            flash.now[:error] = '保存できませんでした'
            render :new
        end
    end

    private
        def task_params
            params.require(:task).permit(:title, :content, :limit_date)
        end
end