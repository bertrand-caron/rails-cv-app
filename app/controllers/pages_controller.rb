class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def curriculum
    @internships = Internship.all
    @referees = Referee.all
  end
end
