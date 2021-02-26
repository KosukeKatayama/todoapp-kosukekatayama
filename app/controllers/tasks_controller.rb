class TasksController < ApplicationController

    def index
        @tasks = Task.all
        @board = Board.find(params[:board_id])
    end
end