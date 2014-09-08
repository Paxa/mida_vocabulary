require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :PostalAddress, 'mida_vocabulary/vocabularies/schemaorg/postaladdress'
    autoload :DeliveryEvent, 'mida_vocabulary/vocabularies/schemaorg/deliveryevent'
    autoload :DeliveryMethod, 'mida_vocabulary/vocabularies/schemaorg/deliverymethod'
    autoload :Product, 'mida_vocabulary/vocabularies/schemaorg/product'
    autoload :Order, 'mida_vocabulary/vocabularies/schemaorg/order'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # The delivery of a parcel either via the postal service or a commercial service.
    class ParcelDelivery < Mida::Vocabulary
      itemtype %r{http://schema.org/ParcelDelivery}i
      include_vocabulary Mida::SchemaOrg::Thing

      # Destination address.
      has_many 'deliveryAddress' do
        extract Mida::SchemaOrg::PostalAddress
        extract Mida::DataType::Text
      end

      # New entry added as the package passes through each leg of its journey (from shipment to final delivery).
      has_many 'deliveryStatus' do
        extract Mida::SchemaOrg::DeliveryEvent
        extract Mida::DataType::Text
      end

      # The earliest date the package may arrive.
      has_many 'expectedArrivalFrom' do
        extract Mida::DataType::ISO8601Date
      end

      # The latest date the package may arrive.
      has_many 'expectedArrivalUntil' do
        extract Mida::DataType::ISO8601Date
      end

      # Method used for delivery or shipping.
      has_many 'hasDeliveryMethod' do
        extract Mida::SchemaOrg::DeliveryMethod
      end

      # Item(s) being shipped.
      has_many 'itemShipped' do
        extract Mida::SchemaOrg::Product
        extract Mida::DataType::Text
      end

      # Shipper's address.
      has_many 'originAddress' do
        extract Mida::SchemaOrg::PostalAddress
        extract Mida::DataType::Text
      end

      # The overall order the items in this delivery were included in.
      has_many 'partOfOrder' do
        extract Mida::SchemaOrg::Order
        extract Mida::DataType::Text
      end

      # The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller. Supercedes carrier.
      has_many 'provider' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # Shipper tracking number.
      has_many 'trackingNumber'

      # Tracking url for the parcel delivery.
      has_many 'trackingUrl' do
        extract Mida::DataType::URL
      end
    end

  end
end
