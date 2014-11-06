class HtmlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    html_doc = Nokogiri::HTML.fragment(value) do |config|
      config.no_warnings
    end
    if html_doc.to_html != value
      record.errors[attribute] << "has unmatched HTML tags. Please fix them.#{html_doc.errors}"
    end
  end
end
