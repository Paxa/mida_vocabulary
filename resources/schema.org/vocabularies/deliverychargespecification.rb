require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PriceSpecification, 'mida_vocabulary/vocabularies/schemaorg/pricespecification'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The price for the delivery of an offer using a particular delivery method.
    class DeliveryChargeSpecification < Mida::Vocabulary
      itemtype %r{http://schema.org/DeliveryChargeSpecification}i
      include_vocabulary Mida::SchemaOrg::PriceSpecification
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
