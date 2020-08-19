class CommentsController < ApplicationController
  #レビュー用のコメント作成のアクション
  def create
    @post = Post.find(params[:post_id])
    # buildを使い、@postのidをpost_idに含んだ形でcommentのインスタンスを作成
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  #レビュー用のコメント削除のアクション
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  # :content, :post_id, :user_id を許可
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
