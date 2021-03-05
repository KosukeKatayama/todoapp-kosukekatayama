class CommentsController < ApplicationController

    def new
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build
    end

    def create
        @board = Board.find(params[:board_id])
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to board_task_path(@board, @task), notice: 'コメントしました'
        else
            flash.now[:error] = 'コメントできませんでした'
            render :new
        end
    end

    private 
        def comment_params
            params.require(:comment).permit(:content)
        end
end