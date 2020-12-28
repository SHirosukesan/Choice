class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: public_users_home_path)
    else
      redirect_back(fallback_location: public_users_home_path)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
