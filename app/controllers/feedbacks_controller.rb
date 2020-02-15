class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      FeedbackMailer.feedback_email(@feedback).deliver_later
    else
      render partial: 'error', locals: { post: @feedback }, status: :bad_request
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:message)
  end
end
