require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PriceSpecification, 'mida_vocabulary/vocabularies/schemaorg/pricespecification'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :DeliveryMethod, 'mida_vocabulary/vocabularies/schemaorg/deliverymethod'
    autoload :PaymentMethod, 'mida_vocabulary/vocabularies/schemaorg/paymentmethod'

    # The costs of settling the payment using a particular payment method.
    class PaymentChargeSpecification < Mida::Vocabulary
      itemtype %r{http://schema.org/PaymentChargeSpecification}i
      include_vocabulary Mida::SchemaOrg::PriceSpecification
      include_vocabulary Mida::SchemaOrg::Thing

      # The delivery method(s) to which the delivery charge or payment charge specification applies.
      has_many 'appliesToDeliveryMethod' do
        extract Mida::SchemaOrg::DeliveryMethod
      end

      # The payment method(s) to which the payment charge specification applies.
      has_many 'appliesToPaymentMethod' do
        extract Mida::SchemaOrg::PaymentMethod
      end
    end

  end
end
