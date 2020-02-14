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
    @project = Project.new(partner_params)

    if @project.save
      redirect_to root_url(anchor: 'partners')
    end
  end

  def update
    if @project.update(partner_params)
      redirect_to root_url(anchor: 'partners'), notice: 'Post was successfully updated.'
    end
  end

  def destroy
    @project.destroy
    redirect_to root_url(anchor: 'partners'), notice: 'Post was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:project).permit(:title, :body, :photo, :description)
    end
end
