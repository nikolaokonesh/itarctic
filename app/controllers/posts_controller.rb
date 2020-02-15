class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:index, :show]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
    @partners = Partner.all
    @projects = Project.all
    @abouts = About.all
    @rekvisits = Rekvisit.all
    @residents = Resident.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Успешно добавлено!'
    else
      render partial: 'error', locals: { post: @post }, status: :bad_request
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Успешно обновлено!'
    else
      render partial: 'error', locals: { post: @post }, status: :bad_request
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_url(anchor: 'news'), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :photo, :description, :top, youtubes_attributes: %i[id url user_id _destroy])
    end
end
