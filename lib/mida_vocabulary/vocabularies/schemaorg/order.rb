require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Offer, 'mida_vocabulary/vocabularies/schemaorg/offer'
    autoload :PostalAddress, 'mida_vocabulary/vocabularies/schemaorg/postaladdress'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :OrderStatus, 'mida_vocabulary/vocabularies/schemaorg/orderstatus'
    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :PaymentMethod, 'mida_vocabulary/vocabularies/schemaorg/paymentmethod'

    # An order is a confirmation of a transaction (a receipt), which can contain multiple line items, each represented by an Offer that has been accepted by the customer.
    class Order < Mida::Vocabulary
      itemtype %r{http://schema.org/Order}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The offer(s) -- e.g., product, quantity and price combinations -- included in the order.
      has_many 'acceptedOffer' do
        extract Mida::SchemaOrg::Offer
        extract Mida::DataType::Text
      end

      # The billing address for the order.
      has_many 'billingAddress' do
        extract Mida::SchemaOrg::PostalAddress
        extract Mida::DataType::Text
      end

      # An entity that arranges for an exchange between a buyer and a seller.  In most cases a broker never acquires or releases ownership of a product or service involved in an exchange.  If it is not clear whether an entity is a broker, seller, or buyer, the latter two terms are preferred. Supercedes bookingAgent.
      has_many 'broker' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # A number that confirms the given order.
      has_many 'confirmationNumber'

      # Party placing the order.
      has_many 'customer' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # Any discount applied (to an Order).
      has_many 'discount' do
        extract Mida::DataType::Number
        extract Mida::DataType::Text
      end

      # Code used to redeem a discount.
      has_many 'discountCode'

      # The currency (in 3-letter ISO 4217 format) of the discount.
      has_many 'discountCurrency'

      # Was the offer accepted as a gift for someone other than the buyer.
      has_many 'isGift' do
        extract Mida::DataType::Boolean
      end

      # Date order was placed.
      has_many 'orderDate' do
        extract Mida::DataType::ISO8601Date
      end

      # The identifier of the transaction.
      has_many 'orderNumber'

      # The current status of the order.
      has_many 'orderStatus' do
        extract Mida::SchemaOrg::OrderStatus
      end

      # The item ordered.
      has_many 'orderedItem' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # The date that payment is due.
      has_many 'paymentDue' do
        extract Mida::DataType::ISO8601Date
      end

      # The name of the credit card or other method of payment for the order.
      has_many 'paymentMethod' do
        extract Mida::SchemaOrg::PaymentMethod
      end

      # An identifier for the method of payment used (e.g. the last 4 digits of the credit card).
      has_many 'paymentMethodId'

      # The URL for sending a payment.
      has_many 'paymentUrl' do
        extract Mida::DataType::URL
      end

      # An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider. Supercedes merchant, vendor.
      has_many 'seller' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end
    end

  end
end
