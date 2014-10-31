module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     false,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  #DRY version of the .edit-tools selectors code
  def edit_tool_tag(edit_path)
    link_to '<i class="fa fa-pencil-square-o"></i>'.html_safe, edit_path
  end

  #DRY version of the .edit-tools selectors code
  def delete_tool_tag(model)
    link_to '<i class="fa fa-close"></i>'.html_safe, model, method: :delete, data: { confirm: 'Are you sure?' }
  end

  def main_color_tag
    "color:#" + ( UserSettings.main_color.to_s == '' ? "F09819" : UserSettings.main_color )
  end

  def secondary_color_tag
    "color:#" + ( UserSettings.secondary_color.to_s == '' ? "F09819" : UserSettings.secondary_color )
  end
end
