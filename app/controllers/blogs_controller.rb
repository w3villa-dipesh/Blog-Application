class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @q = Blog.ransack(params[:q])
    @blogs = @q.result(distinct: true).order(id: :desc).paginate(:page => params[:page], :per_page => 3)

    # @blogs = Blog.all
    @categories = Category.all
    @tags = Tag.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  def show_category
    @categories = Category.all
    @tags = Tag.all
    # @category = Category.where(id: params[:category_id]).first
    @category = Category.find(params[:category_id]) 
    @q = @category.blogs.ransack(params[:q])
    @blogs = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 3)
  end

  def show_tag
    @categories = Category.all
    @tags = Tag.all
    # @tag = Tag.where(id: params[:tag_id]).first
    @tag = Tag.find(params[:tag_id]) 
    @q = @tag.blogs.ransack(params[:q])
    @blogs = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 3)
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    @blog.tags.build
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    if (@blog.user_id == current_user.id || current_user.role == "ADMIN")
      respond_to do |format|
        if @blog.update(blog_params)
          format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
          format.json { render :show, status: :ok, location: @blog }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @blog.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to blogs_path,notice:"You are not allowed to edit this blog."
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :category_id,images: [],tags_attributes: [:id,:name], tag_ids: [])
    end
end
