require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :BusinessFunction, 'mida_vocabulary/vocabularies/schemaorg/businessfunction'
    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'

    # A structured value indicating the quantity, unit of measurement, and business function of goods included in a bundle offer.
    class TypeAndQuantityNode < Mida::Vocabulary
      itemtype %r{http://schema.org/TypeAndQuantityNode}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The quantity of the goods included in the offer.
      has_many 'amountOfThisGood' do
        extract Mida::DataType::Number
      end

      # The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.
      has_many 'businessFunction' do
        extract Mida::SchemaOrg::BusinessFunction
      end

      # The product that this structured value is referring to.
      has_many 'typeOfGood' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # The unit of measurement given using the UN/CEFACT Common Code (3 characters).
      has_many 'unitCode'
    end

  end
end
