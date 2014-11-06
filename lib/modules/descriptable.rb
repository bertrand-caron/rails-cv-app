# Describe Models that have a :description attribute that can and will contain HTML, possibly malformed
module Descriptable
  extend ActiveSupport::Concern

  included do
    #validates :description, html: true
    after_validation :fix_and_filter_desc_html, on: [:create, :update]
  end

  protected
    def fix_and_filter_desc_html
      # Cast the Nokogiri Document
      html_doc = Nokogiri::HTML.fragment(self.description)
      # Remove all scripts
      html_doc.xpath('script').remove
      # Save the filtered and corrected version
      self.description = html_doc.to_html
    end

end
