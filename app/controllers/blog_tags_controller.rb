class BlogTagsController < ApplicationController
  before_action :set_blog_tag, only: %i[ show edit update destroy ]

  # GET /blog_tags or /blog_tags.json
  def index
    @blog_tags = BlogTag.all
  end

  # GET /blog_tags/1 or /blog_tags/1.json
  def show
  end

  # GET /blog_tags/new
  def new
    @blog_tag = BlogTag.new
  end

  # GET /blog_tags/1/edit
  def edit
  end

  # POST /blog_tags or /blog_tags.json
  def create
    @blog_tag = BlogTag.new(blog_tag_params)

    respond_to do |format|
      if @blog_tag.save
        format.html { redirect_to blog_tag_url(@blog_tag), notice: "Blog tag was successfully created." }
        format.json { render :show, status: :created, location: @blog_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_tags/1 or /blog_tags/1.json
  def update
    respond_to do |format|
      if @blog_tag.update(blog_tag_params)
        format.html { redirect_to blog_tag_url(@blog_tag), notice: "Blog tag was successfully updated." }
        format.json { render :show, status: :ok, location: @blog_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_tags/1 or /blog_tags/1.json
  def destroy
    @blog_tag.destroy

    respond_to do |format|
      format.html { redirect_to blog_tags_url, notice: "Blog tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_tag
      @blog_tag = BlogTag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_tag_params
      params.require(:blog_tag).permit(:blog_id, :tag_id)
    end
end
