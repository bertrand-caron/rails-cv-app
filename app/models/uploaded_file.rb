class UploadedFile < ActiveRecord::Base
  HAS_EXTENSION_REGEX= /\.[a-zA-Z]{1,5}\z/
  validates :name, presence: true, format: {with: HAS_EXTENSION_REGEX, message: 'does not have an extension, or its extension is more than five letters long'}

  def absolute_path
    Rails.root.join('public', 'uploads', self.name)
  end

  def relative_url
    "/uploads/#{self.name}"
  end

  def absolute_url
    "https://#{Settings['domain-name']}#{self.relative_url}"
  end
end
