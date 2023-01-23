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
end
