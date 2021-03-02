class TasksController < ApplicationController

    def show
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:id])
    end

    def new
        @task = current_user.tasks.build
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        @task.user = current_user
        if @task.save
            redirect_to board_path(board), notice: '保存されました'
        else
            flash.now[:error] = '保存できませんでした'
            render :new
        end
    end

    private
        def task_params
            params.require(:task).permit(:title, :content, :limit_date, :eyecatch)
        end
end