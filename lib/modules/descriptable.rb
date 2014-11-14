# Describe Models that have a :description attribute that can and will contain HTML, possibly malformed
module Descriptable
  extend ActiveSupport::Concern

  included do
    # validates :description, html: true
    after_validation :fix_and_filter_desc_html, on: [:create, :update]
  end

  protected

  def filtered_html(_html_content)
    # Cast the Nokogiri Document
    html_doc = Nokogiri::HTML.fragment(description)
    # Remove all scripts
    html_doc.xpath('script').remove
    # Returned filtered and fixed html
    html_doc.to_html
  end

  def fix_and_filter_desc_html
    self.description = filtered_html(description)
  end
end
