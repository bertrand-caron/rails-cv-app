module InternshipsHelper
  def has_referee?(referee_id)
    Referee.find(referee_id)
    true
  rescue ActiveRecord::RecordNotFound
    false
  end
end
