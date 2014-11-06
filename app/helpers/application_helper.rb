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
    "color:#" + ( has_setting?(:main_color) ? UserSettings.main_color : "F09819" )
  end

  def secondary_color_tag
    "color:#" + ( has_setting?(:secondary_color) ? UserSettings.secondary_color : "428BCA" )
  end

  def has_setting?(setting)
    UserSettings.send(setting).to_s != ''
  end

  def meta_description_tag
    tag(:meta, {:name => 'description', :content => strip_tags(UserSettings.profile_section)})
  end

  def meta_keywords_tag
    tag(:meta, {:name => 'keywords', :content => "#{UserSettings.full_name} #{UserSettings.page_title} #{UserSettings.main_occupation}".gsub(/ /,',') })
  end

  def pretty_name_for(model_name)
    if model_name == 'educations'
      'Education'
    else
      model_name.tr('_',' ').titleize
    end
  end

  def model_name_for(pretty_name)
    pretty_name.downcase.pluralize.tr(' ','_')
  end
end
