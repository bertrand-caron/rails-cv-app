class PagesController < ApplicationController
  #caches_page :curriculum, :contact

  def home
  end

  def contact
  end

  def curriculum
    @educations = Education.all
    @internships = Internship.all
    @programming_skills= ProgrammingSkill.all
    @awards = Award.all
    @publications = Publication.all
    @referees = Referee.all
  end

  def contact_send
    if params[:email][0..1] == params[:surprise]
      UserMailer.send_email(params[:email],params[:content]).deliver
      flash[:notice] = "Your email was successfully sent."
    end
    redirect_to root_path
  end
end
