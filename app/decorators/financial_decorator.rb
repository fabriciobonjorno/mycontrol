# frozen_string_literal: true

class FinancialDecorator < ApplicationDecorator
  delegate_all

  def transact_format(value)
    if financial.transaction_type == 'credit'
      label_class = 'text-success'
      "<span class='#{label_class}'> + #{value}</span>".html_safe
    else
      label_class = 'text-danger'
      "<span class='#{label_class}'> - #{value}</span>".html_safe
    end
  end
end
