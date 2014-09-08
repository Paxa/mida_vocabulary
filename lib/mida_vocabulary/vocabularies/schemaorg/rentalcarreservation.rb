require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Reservation, 'mida_vocabulary/vocabularies/schemaorg/reservation'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'

    # A reservation for a rental car.
    class RentalCarReservation < Mida::Vocabulary
      itemtype %r{http://schema.org/RentalCarReservation}i
      include_vocabulary Mida::SchemaOrg::Reservation
      include_vocabulary Mida::SchemaOrg::Thing

      # Where a rental car can be dropped off.
      has_many 'dropoffLocation' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # When a rental car can be dropped off.
      has_many 'dropoffTime' do
        extract Mida::DataType::ISO8601Date
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
