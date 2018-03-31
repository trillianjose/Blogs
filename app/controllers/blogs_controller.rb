class BlogsController < ApplicationController
  before_action :authenticate_author!, except: [:index, :show]
  skip_before_action :verify_authenticity_token, only: :destroy

  def index
    @blogs = Blog.order(created_at: :asc)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.author = current_author
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy

    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
