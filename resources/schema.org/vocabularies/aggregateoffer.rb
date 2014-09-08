require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Offer, 'mida_vocabulary/vocabularies/schemaorg/offer'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # When a single product is associated with multiple offers (for example, the same pair of shoes is offered by different merchants), then AggregateOffer can be used.
    class AggregateOffer < Mida::Vocabulary
      itemtype %r{http://schema.org/AggregateOffer}i
      include_vocabulary Mida::SchemaOrg::Offer
      include_vocabulary Mida::SchemaOrg::Thing

      # The highest price of all offers available.
      has_many 'highPrice' do
        extract Mida::DataType::Number
        extract Mida::DataType::Text
      end

      # The lowest price of all offers available.
      has_many 'lowPrice' do
        extract Mida::DataType::Number
        extract Mida::DataType::Text
      end

      # The number of offers for the product.
      has_many 'offerCount' do
        extract Mida::DataType::Integer
      end
    end

  end
end
