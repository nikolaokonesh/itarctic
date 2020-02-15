class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:show]

  def show
  end

  def new
    @resident = Resident.new
  end

  def edit
  end

  def create
    @resident = Resident.new(resident_params)
    if @resident.save
      redirect_to @resident, notice: 'Успешно добавлено!'
    else
      render partial: 'error', locals: { post: @resident }, status: :bad_request
    end
  end

  def update
    if @resident.update(resident_params)
      redirect_to @resident, notice: 'Успешно обновлено!'
    else
      render partial: 'error', locals: { post: @resident }, status: :bad_request
    end
  end

  def destroy
    @resident.destroy
    respond_to do |format|
      format.html { redirect_to root_url(anchor: 'center'), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_resident
      @resident = Resident.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resident_params
      params.require(:resident).permit(:name, :body, :photo)
    end
end
