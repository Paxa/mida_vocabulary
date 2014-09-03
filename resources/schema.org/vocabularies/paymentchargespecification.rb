require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PriceSpecification, 'mida_vocabulary/vocabularies/schemaorg/pricespecification'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The costs of settling the payment using a particular payment method.
    class PaymentChargeSpecification < Mida::Vocabulary
      itemtype %r{http://schema.org/PaymentChargeSpecification}i
      include_vocabulary Mida::SchemaOrg::PriceSpecification
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
