require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'
    autoload :ProgramMembership, 'mida_vocabulary/vocabularies/schemaorg/programmembership'
    autoload :ReservationStatusType, 'mida_vocabulary/vocabularies/schemaorg/reservationstatustype'
    autoload :Ticket, 'mida_vocabulary/vocabularies/schemaorg/ticket'
    autoload :PriceSpecification, 'mida_vocabulary/vocabularies/schemaorg/pricespecification'

    # Describes a reservation for travel, dining or an event. Some reservations require tickets.
    class Reservation < Mida::Vocabulary
      itemtype %r{http://schema.org/Reservation}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The date and time the reservation was booked.
      has_many 'bookingTime' do
        extract Mida::DataType::ISO8601Date
      end

      # An entity that arranges for an exchange between a buyer and a seller.  In most cases a broker never acquires or releases ownership of a product or service involved in an exchange.  If it is not clear whether an entity is a broker, seller, or buyer, the latter two terms are preferred. Supercedes bookingAgent.
      has_many 'broker' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The date and time the reservation was modified.
      has_many 'modifiedTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The currency (in 3-letter ISO 4217 format) of the price or a price component, when attached to PriceSpecification and its subtypes.
      has_many 'priceCurrency'

      # Any membership in a frequent flyer, hotel loyalty program, etc. being applied to the reservation.
      has_many 'programMembershipUsed' do
        extract Mida::SchemaOrg::ProgramMembership
        extract Mida::DataType::Text
      end

      # The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller. Supercedes carrier.
      has_many 'provider' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The thing -- flight, event, restaurant,etc. being reserved.
      has_many 'reservationFor' do
        extract Mida::SchemaOrg::Thing
        extract Mida::DataType::Text
      end

      # A unique identifier for the reservation.
      has_many 'reservationId'

      # The current status of the reservation.
      has_many 'reservationStatus' do
        extract Mida::SchemaOrg::ReservationStatusType
      end

      # A ticket associated with the reservation.
      has_many 'reservedTicket' do
        extract Mida::SchemaOrg::Ticket
        extract Mida::DataType::Text
      end

      # The total price for the reservation or ticket, including applicable taxes, shipping, etc.
      has_many 'totalPrice' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::PriceSpecification
        extract Mida::DataType::Text
      end

      # The person or organization the reservation or ticket is for.
      has_many 'underName' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end
    end

  end
end
