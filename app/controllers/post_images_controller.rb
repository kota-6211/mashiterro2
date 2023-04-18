class PostImagesController < ApplicationController
  def new
    @post = PostImage.new
  end
  
  def create
    @post = PostImage.new(post_image_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_images_path
  end

  def index
    @post = PostImage.all
  end

  def show
    @post = PostImage.find_by(id: params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    @post = PostImage.find_by(id: params[:id])
    @post.destroy
    redirect_to post_images_path
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :caption, :image)
  end
  
end
