require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Seat, 'mida_vocabulary/vocabularies/schemaorg/seat'
    autoload :PriceSpecification, 'mida_vocabulary/vocabularies/schemaorg/pricespecification'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # Used to describe a ticket to an event, a flight, a bus ride, etc.
    class Ticket < Mida::Vocabulary
      itemtype %r{http://schema.org/Ticket}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The date the ticket was issued.
      has_many 'dateIssued' do
        extract Mida::DataType::ISO8601Date
      end

      # The organization issuing the ticket or permit.
      has_many 'issuedBy' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # The currency (in 3-letter ISO 4217 format) of the price or a price component, when attached to PriceSpecification and its subtypes.
      has_many 'priceCurrency'

      # The unique identifier for the ticket.
      has_many 'ticketNumber'

      # Reference to an asset (e.g., Barcode, QR code image or PDF) usable for entrance.
      has_many 'ticketToken' do
        extract Mida::DataType::URL
        extract Mida::DataType::Text
      end

      # The seat associated with the ticket.
      has_many 'ticketedSeat' do
        extract Mida::SchemaOrg::Seat
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
