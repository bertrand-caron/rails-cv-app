class HelpersController < ApplicationController
  before_action :signed_in_user

  #POST /helpers/html_renderer[:content]
  def html_renderer
    # Cast the Nokogiri Document
    html_doc = Nokogiri::HTML.fragment params[:content]
    # Remove all scripts
    html_doc.xpath('script').remove
    # Returned filtered and fixed html
    @content = html_doc.to_html
    respond_to do |format|
      format.html {render :text => @content}
      format.json do
        render :html_renderer, status: :ok
      end
    end
  end

end
