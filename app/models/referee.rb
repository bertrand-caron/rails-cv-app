class Referee < ActiveRecord::Base
  include Listable
  default_scope  { order(:rank => :desc) }

  def gender_pronoun(options=nil)
    if options == :object
      self.gender == 0 && "him" || "her"
    elsif options == :subject
      self.gender == 0 && "he" || "she"
    end
  end
end
