module Listable
  extend ActiveSupport::Concern

  included do
    validates :rank, numericality: true
  end
end
