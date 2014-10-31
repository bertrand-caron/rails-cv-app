module PagesHelper

  def empty_section?(models_name)
    # Taken from http://stackoverflow.com/questions/14070369/how-to-instantiate-class-from-name-string-in-rails
    not Object.const_get(models_name.gsub(/ /,'').singularize).any?
  end
end
