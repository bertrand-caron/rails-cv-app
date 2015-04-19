module Blog
  module ApplicationHelper
    include FontAwesome::Rails::IconHelper

    def markdown(text, options={})
      renderer = Redcarpet::Render::HTML.new()
      markdown_renderer = Redcarpet::Markdown.new(renderer, extensions = {})
      # options = {downgrade: n} Downgrade Markdown heading by n levels for better rendering in the context of the page
      markdown_renderer.render(options.key?(:downgrade) ? text.gsub(/(#)+/, '\&###') : text).html_safe
    end

  end
end
