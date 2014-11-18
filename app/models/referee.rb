class Referee < ActiveRecord::Base
  include Listable
  belongs_to :uploaded_file

  def gender_pronoun(options = nil)
    if options == :object
      gender == 0 ? 'him' : 'her'
    elsif options == :subject
      gender == 0 ? 'he' : 'she'
    end
  end

  def comment
    uploaded_file.try(:extract)
  end
end
