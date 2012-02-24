require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    autoload :Organization, 'mida_vocabulary/vocabularies/data_vocabulary/organization'
    autoload :Offer, 'mida_vocabulary/vocabularies/data_vocabulary/offer'
    autoload :OfferAggregate, 'mida_vocabulary/vocabularies/data_vocabulary/offer_aggregate'

    class Product < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Product}i
      include_vocabulary Mida::DataVocabulary::Item

      for field in %w{name image description category identifier}
        has_many field
      end

      # Google recommends including brand and at least one identifier for each product.
      has_many 'brand' do
        extract Mida::DataVocabulary::Organization
        extract Mida::DataType::Text
      end

      has_many 'offerDetails' do
        extract Mida::DataVocabulary::Offer
        extract Mida::DataVocabulary::OfferAggregate
      end
    end
  end
end
      