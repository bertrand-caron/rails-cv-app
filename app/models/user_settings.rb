class UserSettings < RailsSettings::CachedSettings
  # Set a param, whatever is current value (or lack of)
  def self.set_param_to(param_str, value)
    send("#{param_str}=".to_sym, value)
  end

  # Only init missing params, won't modify already set ones
  def self.init_param_to(param_str, value)
    set_param_to(param_str, value) unless send(param_str.to_sym)
  end
end
