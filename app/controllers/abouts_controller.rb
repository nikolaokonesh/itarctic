class AboutsController < ApplicationController
  before_action :set_about, only: [:edit, :update, :destroy]
  load_and_authorize_resource :except => [:index]

  def new
    @about = About.new
  end

  def create
    @about = About.new(about_params)

    if @about.save
      redirect_to root_url(anchor: 'center'), notice: 'Успешно добавлено!'
    else
      render partial: 'error', locals: { post: @about }, status: :bad_request
    end
  end

  def edit
  end

  def update
    if @about.update(about_params)
      redirect_to root_url(anchor: 'center'), notice: 'Успешно обновлено!'
    else
      render partial: 'error', locals: { post: @about }, status: :bad_request
    end
  end

  def destroy
    @about.destroy
    respond_to do |format|
      format.html { redirect_to root_url(anchor: 'center'), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_about
      @about = About.find(params[:id])
    end

    def about_params
      params.require(:about).permit(:title, :body)
    end

end
