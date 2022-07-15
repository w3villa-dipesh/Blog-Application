class CommentsController < ApplicationController

    def create
        @comment = current_user.comments.new(comment_params)
        if !@comment.save
            flash[:notice] = @comment.errors.full_messages.to_sentence
        end

        # redirect_to @comment.blog
        redirect_to blog_path(params[:blog_id])
    end

    private 
    def comment_params
        params.require(:comment).permit(:content,:parent_id).merge(blog_id: params[:blog_id])
    end
end
