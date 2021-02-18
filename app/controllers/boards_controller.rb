class BoardsController < ApplicationController
    def index
        @board = Board.first
    end

    def new
    end
end