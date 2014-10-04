class PagesController < ApplicationController
  #caches_page :curriculum, :contact

  def home
  end

  def contact
    add_breadcrumb "Contact", contact_path
  end

  def curriculum
  end

  def contact_send
    if params[:email][0..1] == params[:surprise]
      UserMailer.send_contact_email(params[:email],params[:content]).deliver
      flash[:notice] = "Your email was successfully sent."
    end
    redirect_to root_path
  end

  def subscribe
    @follower = Follower.new(email: params[:email])
    @follower.reminder = params[:when].to_i.days.from_now
    if @follower.save
      render :text => "Subscribed"
    else
      render :text => "Failed"
    end
  end

end
