class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:show]

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Успешно добавлено!'
    else
      render partial: 'error', locals: { post: @project }, status: :bad_request
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Успешно обновлено!'
    else
      render partial: 'error', locals: { post: @project }, status: :bad_request
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_url(anchor: 'projects'), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :body, :photo, :description, :url)
    end
end
