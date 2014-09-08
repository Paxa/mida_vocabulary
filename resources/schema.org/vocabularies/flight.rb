require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Vehicle, 'mida_vocabulary/vocabularies/schemaorg/vehicle'
    autoload :Airport, 'mida_vocabulary/vocabularies/schemaorg/airport'
    autoload :Duration, 'mida_vocabulary/vocabularies/schemaorg/duration'
    autoload :Distance, 'mida_vocabulary/vocabularies/schemaorg/distance'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # An airline flight.
    class Flight < Mida::Vocabulary
      itemtype %r{http://schema.org/Flight}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The kind of aircraft (e.g., "Boeing 747").
      has_many 'aircraft' do
        extract Mida::SchemaOrg::Vehicle
        extract Mida::DataType::Text
      end

      # The airport where the flight terminates.
      has_many 'arrivalAirport' do
        extract Mida::SchemaOrg::Airport
        extract Mida::DataType::Text
      end

      # Identifier of the flight's arrival gate.
      has_many 'arrivalGate'

      # Identifier of the flight's arrival terminal.
      has_many 'arrivalTerminal'

      # The expected arrival time.
      has_many 'arrivalTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The airport where the flight originates.
      has_many 'departureAirport' do
        extract Mida::SchemaOrg::Airport
        extract Mida::DataType::Text
      end

      # Identifier of the flight's departure gate.
      has_many 'departureGate'

      # Identifier of the flight's departure terminal.
      has_many 'departureTerminal'

      # The expected departure time.
      has_many 'departureTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The estimated time the flight will take.
      has_many 'estimatedFlightDuration' do
        extract Mida::SchemaOrg::Duration
        extract Mida::DataType::Text
      end

      # The distance of the flight.
      has_many 'flightDistance' do
        extract Mida::SchemaOrg::Distance
        extract Mida::DataType::Text
      end

      # The unique identifier for a flight including the airline IATA code. For example, if describing United flight 110, where the IATA code for United is 'UA', the flightNumber is 'UA110'.
      has_many 'flightNumber'

      # Description of the meals that will be provided or available for purchase.
      has_many 'mealService'

      # The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller. Supercedes carrier.
      has_many 'provider' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider. Supercedes merchant, vendor.
      has_many 'seller' do
        extract Mida::SchemaOrg::Organization
        extract Mida::SchemaOrg::Person
        extract Mida::DataType::Text
      end

      # The time when a passenger can check into the flight online.
      has_many 'webCheckinTime' do
        extract Mida::DataType::ISO8601Date
      end
    end

  end
end
