# frozen_string_literal: true

class InstallmentDecorator < ApplicationDecorator
  delegate_all

  def status_format(status)
    label_class = if installment.status == 'paid'
                    'badge text-bg-success'
                  else
                    'badge text-bg-danger'
                  end
    "<span class='#{label_class}'> #{status}</span>".html_safe
  end
end
