class FeedbackMailer < ApplicationMailer
  def feedback_email(feedback)
    @feedback = feedback
    mail(to: 'info@itarctic.ru', subject: 'Обратная связь')
  end
end
