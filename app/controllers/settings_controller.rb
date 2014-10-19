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
      eval("UserSettings.#{key} = \"#{value}\" ")
    end
    redirect_to settings_path, notice: 'Settings Updated'
  end

  private

    def settings_params
      params.permit(:full_name,:page_title, :main_occupation, :alt_occupation, :contact_email)
    end
end
