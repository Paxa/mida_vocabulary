require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'

    # A placeholder for multiple similar products of the same kind.
    class SomeProducts < Mida::Vocabulary
      itemtype %r{http://schema.org/SomeProducts}i
      include_vocabulary Mida::SchemaOrg::Product
      include_vocabulary Mida::SchemaOrg::Thing

      # The current approximate inventory level for the item or items.
      has_many 'inventoryLevel' do
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end
    end

  end
end
