class InstallmentDecorator < ApplicationDecorator
  delegate_all

  def status_format(status)
    if installment.status == 'paid'
      label_class = 'badge text-bg-success'
      "<span class='#{label_class}'> #{status}</span>".html_safe
    else
      label_class = 'badge text-bg-danger'
      "<span class='#{label_class}'> #{status}</span>".html_safe
    end
  end
end
