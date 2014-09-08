require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :DeliveryMethod, 'mida_vocabulary/vocabularies/schemaorg/deliverymethod'

    # An event involving the delivery of an item.
    class DeliveryEvent < Mida::Vocabulary
      itemtype %r{http://schema.org/DeliveryEvent}i
      include_vocabulary Mida::SchemaOrg::Event
      include_vocabulary Mida::SchemaOrg::Thing

      # Password, PIN, or access code needed for delivery (e.g. from a locker).
      has_many 'accessCode'

      # When the item is available for pickup from the store, locker, etc.
      has_many 'availableFrom' do
        extract Mida::DataType::ISO8601Date
      end

      # After this date, the item will no longer be available for pickup.
      has_many 'availableThrough' do
        extract Mida::DataType::ISO8601Date
      end

      # Method used for delivery or shipping.
      has_many 'hasDeliveryMethod' do
        extract Mida::SchemaOrg::DeliveryMethod
      end
    end

  end
end
