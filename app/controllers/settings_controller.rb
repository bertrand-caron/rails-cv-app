class SettingsController < ApplicationController
  add_breadcrumb "Settings", :settings_path
  before_action :signed_in_user, only: [:show, :edit, :update]

  # GET /settings
  def show
    redirect_to settings_edit_path
  end

  # GET /settings/edit
  def edit
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
