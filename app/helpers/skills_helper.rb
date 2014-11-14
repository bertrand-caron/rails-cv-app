module SkillsHelper
  def star_tag(item)
    raw item.star_tag
  end

  # Help produce a tag from a single name from both font-awesome and font-mfizz
  def icon_tag_for(icon_name)
    if icon_name =~ /\Afa/
      content_tag 'i', nil, class: "fa #{icon_name}"
    elsif icon_name =~ /\Aicon/
      content_tag 'i', nil, class: icon_name
    end
  end
end
