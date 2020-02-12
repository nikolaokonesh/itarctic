class PartnersController < ApplicationController
  before_action :set_partner, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @partner = Partner.new
  end

  def edit
  end

  def create
    @partner = Partner.new(partner_params)

    if @partner.save
      redirect_to root_url(anchor: 'partners')
    end
  end

  def update
    if @partner.update(partner_params)
      redirect_to root_url(anchor: 'partners'), notice: 'Post was successfully updated.'
    end
  end

  def destroy
    @partner.destroy
    redirect_to root_url(anchor: 'partners'), notice: 'Post was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:photo, :url)
    end
end
