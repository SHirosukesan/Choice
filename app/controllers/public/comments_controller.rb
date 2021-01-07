class Public::CommentsController < ApplicationController
	def create
    shop = Shop.find(params[:shop_id])
    @comment = shop.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save!
      redirect_to public_shop_path(current_user)
    else
      redirect_to public_shop_path(current_user)
    end
  end

  def destroy
    Comment.find_by(id: params[:id],shop_id: params[:shop_id]).destroy
    redirect_to public_shop_path(current_user)
  end



  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end