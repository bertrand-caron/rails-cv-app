# Describe Models that have a :rank attribute
module Listable
  extend ActiveSupport::Concern

  included do
    validates :rank, numericality: true
    default_scope  { order(rank: :desc) }
  end
end
