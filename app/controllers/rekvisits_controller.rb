class RekvisitsController < ApplicationController
  before_action :set_rekvisit, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:show]

  def show
  end

  def new
    @rekvisit = Rekvisit.new
  end

  def edit
  end

  def create
    @rekvisit = Rekvisit.new(rekvisit_params)
    if @rekvisit.save
      redirect_to @rekvisit, notice: 'Успешно добавлено!'
    else
      render partial: 'error', locals: { post: @rekvisit }, status: :bad_request
    end
  end

  def update
    if @rekvisit.update(rekvisit_params)
      redirect_to @rekvisit, notice: 'Успешно обновлено!'
    else
      render partial: 'error', locals: { post: @rekvisit }, status: :bad_request
    end
  end

  def destroy
    @rekvisit.destroy
    respond_to do |format|
      format.html { redirect_to root_url(anchor: 'rekvisit'), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_rekvisit
      @rekvisit = Rekvisit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rekvisit_params
      params.require(:rekvisit).permit(:title, :body)
    end
end
