class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "You commented!"
      
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
