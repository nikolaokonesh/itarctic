class ApplicationController < ActionController::Base

  before_action :header_title

  protected

  def header_title
    @header = Header.first
  end

end
