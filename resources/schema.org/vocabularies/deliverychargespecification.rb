require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PriceSpecification, 'mida_vocabulary/vocabularies/schemaorg/pricespecification'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :DeliveryMethod, 'mida_vocabulary/vocabularies/schemaorg/deliverymethod'
    autoload :GeoShape, 'mida_vocabulary/vocabularies/schemaorg/geoshape'

    # The price for the delivery of an offer using a particular delivery method.
    class DeliveryChargeSpecification < Mida::Vocabulary
      itemtype %r{http://schema.org/DeliveryChargeSpecification}i
      include_vocabulary Mida::SchemaOrg::PriceSpecification
      include_vocabulary Mida::SchemaOrg::Thing

      # The delivery method(s) to which the delivery charge or payment charge specification applies.
      has_many 'appliesToDeliveryMethod' do
        extract Mida::SchemaOrg::DeliveryMethod
      end

      # The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.
      has_many 'eligibleRegion' do
        extract Mida::SchemaOrg::GeoShape
        extract Mida::DataType::Text
      end
    end

  end
end
