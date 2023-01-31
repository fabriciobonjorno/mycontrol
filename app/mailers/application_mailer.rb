# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper
  helper :application
  default from: "no-reply@mysite.com"
  layout 'mailer'
end
