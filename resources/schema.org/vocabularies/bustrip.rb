require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :BusStation, 'mida_vocabulary/vocabularies/schemaorg/busstation'
    autoload :BusStop, 'mida_vocabulary/vocabularies/schemaorg/busstop'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # A trip on a commercial bus line.
    class BusTrip < Mida::Vocabulary
      itemtype %r{http://schema.org/BusTrip}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The stop or station from which the bus arrives.
      has_many 'arrivalBusStop' do
        extract Mida::SchemaOrg::BusStation
        extract Mida::SchemaOrg::BusStop
        extract Mida::DataType::Text
      end

      # The expected arrival time.
      has_many 'arrivalTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The name of the bus (e.g. Bolt Express).
      has_many 'busName'

      # The unique identifier for the bus.
      has_many 'busNumber'

      # The stop or station from which the bus departs.
      has_many 'departureBusStop' do
        extract Mida::SchemaOrg::BusStation
        extract Mida::SchemaOrg::BusStop
        extract Mida::DataType::Text
      end

      # The expected departure time.
      has_many 'departureTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller. Supercedes carrier.
      has_many 'provider' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end
    end

  end
end
