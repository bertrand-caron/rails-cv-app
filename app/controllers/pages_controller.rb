class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def curriculum
    @educations = Education.all
    @internships = Internship.all
    @awards = Award.all
    @referees = Referee.all
  end
end
