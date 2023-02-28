class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
        @post=Post.find(params[:id])
        @comments=post_comments(@post)
    end


    def create
        @post=Post.find(params[:id])
        @comment=@post.comments.create(comments_params)
        if @comment.save
            #turbo streamstuffs
        else
            flash.alert='Comment Not Saved'
            render new
        end
    end

    def edit
        @comment=Comment.find(params[:id])
    end

    def update
        @comment=Comment.find(params[:id])

        if @comment.update(comments_params)
            flash[:notice]='Comment updated'
            #turbostream stuff
        else
            flash[:alert]='Comment Not updated'
            render edit
        end
    end
    
    private
    def comments_params
        params.require(:comment).permit(:id,:commentable_type,:commentable_id,:body,:user_id)
    end
end
