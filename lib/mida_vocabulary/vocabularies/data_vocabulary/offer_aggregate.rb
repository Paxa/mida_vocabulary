require 'mida_vocabulary/vocabulary'
require 'mida_vocabulary/vocabularies/data_vocabulary/item'

module Mida
  module DataVocabulary
    autoload :Product, 'mida_vocabulary/vocabularies/data_vocabulary/product'

    class OfferAggregate < Mida::Vocabulary
      itemtype %r{http://data-vocabulary.org/Offer-aggregate/}i
      include_vocabulary Mida::DataVocabulary::Item

      for field in %w{lowPrice highPrice currency condition offerURL identifier}
        has_many field
      end

      has_many 'offerCount' do
        extract Mida::DataType::Number
        extract Mida::DataType::Text
      end

      has_many 'itemOffered' do
        extract Mida::DataVocabulary::Product
        extract Mida::DataType::Text
      end
    end
  end
end
