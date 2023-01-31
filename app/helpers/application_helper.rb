# frozen_string_literal: true

module ApplicationHelper
  def icon(icon, options = {})
    file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    svg['class'] += " #{options[:class]}" if options[:class].present?
    svg['width'] = options[:width] if options[:width].present?
    svg['height'] = options[:height] if options[:height].present?
    svg['viewBox'] = options[:viewBox] if options[:viewBox].present?
    doc.to_html.html_safe
  end

  def currency_br(value)
    number_to_currency(value, unit: 'R$ ', separator: ',', delimiter: '.')
  end

  def url_default
    Rails.env.production? ? 'https://mycontrol.fly.dev/' : 'http://localhost:3000/'
  end

  def group_url
    'dashboard/financials/list_transction?group='
  end

  def url_show_group(group)
    url_default + group_url + "#{group}"
  end
end
