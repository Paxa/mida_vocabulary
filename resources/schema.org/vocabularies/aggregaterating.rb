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

      # The item that is being reviewed/rated.
      has_many 'itemReviewed' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # The count of total number of ratings.
      has_many 'ratingCount' do
        extract Mida::DataType::Number
      end

      # The count of total number of reviews.
      has_many 'reviewCount' do
        extract Mida::DataType::Number
      end
    end

  end
end
