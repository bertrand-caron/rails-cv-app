class Referee < ActiveRecord::Base
  include Listable
  belongs_to :uploaded_file
  default_scope  { order(:rank => :desc) }

  def gender_pronoun(options=nil)
    if options == :object
      self.gender == 0 && "him" || "her"
    elsif options == :subject
      self.gender == 0 && "he" || "she"
    end
  end

  def comment
    self.uploaded_file.try(:extract)
  end
end
