# Describe Models that have a :description attribute that can and will contain HTML, possibly malformed
module Descriptable
  extend ActiveSupport::Concern

  included do
    #validates :description, html: true
    after_validation :fix_html, on: [:create, :update]
  end

  protected
    def fix_html
      self.description = Nokogiri::HTML.fragment(self.description).to_html
    end
end
