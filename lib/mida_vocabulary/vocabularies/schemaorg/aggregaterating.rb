require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Rating, 'mida_vocabulary/vocabularies/schemaorg/rating'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The average rating based on multiple ratings or reviews.
    class AggregateRating < Mida::Vocabulary
      itemtype %r{http://schema.org/AggregateRating}i
      include_vocabulary Mida::SchemaOrg::Rating
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
