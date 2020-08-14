class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:item_id])

  end

end
