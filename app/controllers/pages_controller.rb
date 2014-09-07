class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def curriculum
    @educations = Education.all
    @internships = Internship.all
    @referees = Referee.all
  end
end
