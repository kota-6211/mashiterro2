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
  end

  def show
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :caption, :image)
  end
  
end
