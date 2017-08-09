class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]
  def index
    @user = current_user
    if params[:search].present?
      @posts = Post.near(params[:search], 50, :order => 'distance', :units => :km)
    else
      @posts = Post.all
    end
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to @post
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :about, :title, :property_type, :beds, :location, :accommodates, :bathrooms, :bedrooms, :room_type, :amenities, :price, :house_rules, :address, :latitude, :longitude)
  end

  def set_post
    @post = Post.find(params[:id])
  end
  def owned_post
    unless current_user == @post.user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end
end
