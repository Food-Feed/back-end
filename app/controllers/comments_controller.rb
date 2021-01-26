class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments
    end

    def create
        # byebug
        comment = Comment.create(user_id: current_user.id, recipe_id: params[:recipe_id], content: params[:content])
        render json: comment
    end

    def update
        comment = Comment.find(params[:id])
        comment.update(content: params[:content])
        render json: comment
    end

    def destroy 
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end

    private 

    def comment_params
        params.permit(:id, :user_id, :recipe_id, :content, :username)
    end
end
