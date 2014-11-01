class SettingsController < ApplicationController
  add_breadcrumb "Settings", :settings_path
  before_action :signed_in_user, only: [:show, :edit, :update]

  # GET /settings
  def show
    redirect_to settings_edit_path
  end

  # GET /settings/edit
  def edit
    @help_hash = {
      :full_name => "Your full name. Ex: 'John Doe'",
      :page_title => "The title of your Résumé. Ex: 'Curriculum Vitae' or 'CV'",
      :main_occupation => "Your main occupation or title. Ex: 'Aero-spatial Engineer'",
      :alt_occupation => "Alternate occupation title displayed when hovering over your main occupation. Leave empty to disable. Ex: 'Your next hire ?'",
      :contact_email => "Your contact email, to which the contact emails will be forwarded. Ex: 'john.doe@jdoe.me'",
      :mobile_phone => "Your mobile phone number.",
      :address => "Your contact physical mail address.",
      :infos => "Any additional information can be fitted here. Ex: 'Driving Licence' or '27 years old'",
      :github_name => "Your Github name. Leave empty to disable.",
      :stackoverflow_id => "Your StackOverflow account id. Leave empty to disable.",
      :stackoverflow_name => "Any name you would like to see displayed. Leave empty to disable.",
      :linkedIn_alias => "Your LinkedIn page, without the 'https://www.linkedin.com/in/' part. Ex: 'johndoe'. Leave empty to disable.",
      :twitter_alias => "Your Twitter alias, without the @. Ex: 'John_Doe'. Leave empty to disable.",
      :main_color => "Hexadecimal color (without the pound '#' symbol) used for your Name, as well as for the titles of the sections. Ex: 'F09819'",
      :secondary_color => "Hexadecimal color (without the pound '#' symbol) used for your for the titles of the items. Ex: '428BCA'"
    }
  end

  # PATCH/PUT /settings/edit
  def update
    settings_params.each do |key,value|
      # The gsub is crucial to avoid simply breaking the eval, or worst potential Injection Attacks !
      # I submitted an Issue Ticket to rails-settings-cached people (Issue #50)
      eval("UserSettings.#{key} = \"#{value.gsub(/"/,'')}\" ")
    end
    redirect_to settings_path, notice: 'Settings Updated'
  end

  private

    def settings_params
      params.permit(:full_name,:page_title, :main_occupation, :alt_occupation, :contact_email, :mobile_phone, :address, :infos, :github_name, :stackoverflow_id, :stackoverflow_name, :twitter_alias, :linkedIn_alias, :main_color, :secondary_color)
    end
end
