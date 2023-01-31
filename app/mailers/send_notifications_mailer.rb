# frozen_string_literal: true

class SendNotificationsMailer < ApplicationMailer
  def send_invoices(user, find_invoices, options = {})
    attachments.inline['logo.png'] = File.read("#{Rails.root}/app/assets/images/logo.png")
    @user = user
    @invoices = find_invoices
    @link = url_default
    @options = options
    mail(to: @user.email, subject: I18n.t('send_invoices.title'))
  end
end
