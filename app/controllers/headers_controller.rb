class HeadersController < ApplicationController
  before_action :set_header
  load_and_authorize_resource

  def edit
  end

  def update
    respond_to do |format|
      if @header.update(header_params)
        format.js
      else
        format.html { render :edit }
        format.json { render json: @header.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_header
      @header = Header.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def header_params
      params.require(:header).permit(:one, :two, :tree)
    end
end
