require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Action, 'mida_vocabulary/vocabularies/schemaorg/action'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The act of participating in an exchange of goods and services for monetary compensation. An agent trades an object, product or service with a participant in exchange for a one time or periodic payment.
    class TradeAction < Mida::Vocabulary
      itemtype %r{http://schema.org/TradeAction}i
      include_vocabulary Mida::SchemaOrg::Action
      include_vocabulary Mida::SchemaOrg::Thing

      # The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes.
      has_many 'price' do
        extract Mida::DataType::Number
        extract Mida::DataType::Text
      end
    end

  end
end
