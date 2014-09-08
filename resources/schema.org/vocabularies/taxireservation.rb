require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Reservation, 'mida_vocabulary/vocabularies/schemaorg/reservation'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :QuantitativeValue, 'mida_vocabulary/vocabularies/schemaorg/quantitativevalue'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # A reservation for a taxi.
    class TaxiReservation < Mida::Vocabulary
      itemtype %r{http://schema.org/TaxiReservation}i
      include_vocabulary Mida::SchemaOrg::Reservation
      include_vocabulary Mida::SchemaOrg::Thing

      # Number of people the reservation should accommodate.
      has_many 'partySize' do
        extract Mida::DataType::Number
        extract Mida::SchemaOrg::QuantitativeValue
        extract Mida::DataType::Text
      end

      # Where a taxi will pick up a passenger or a rental car can be picked up.
      has_many 'pickupLocation' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # When a taxi will pickup a passenger or a rental car can be picked up.
      has_many 'pickupTime' do
        extract Mida::DataType::ISO8601Date
      end
    end

  end
end
