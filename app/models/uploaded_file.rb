class UploadedFile < ActiveRecord::Base
  HAS_EXTENSION_REGEX= /\.[a-zA-Z]{1,5}\z/
  validates :name, format: {with: HAS_EXTENSION_REGEX, message: 'does not have an extension, or its extension is more than five letters long'}
end
