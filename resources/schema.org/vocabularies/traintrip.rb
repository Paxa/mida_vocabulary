require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :TrainStation, 'mida_vocabulary/vocabularies/schemaorg/trainstation'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Person, 'mida_vocabulary/vocabularies/schemaorg/person'

    # A trip on a commercial train line.
    class TrainTrip < Mida::Vocabulary
      itemtype %r{http://schema.org/TrainTrip}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The platform where the train arrives.
      has_many 'arrivalPlatform'

      # The station where the train trip ends.
      has_many 'arrivalStation' do
        extract Mida::SchemaOrg::TrainStation
        extract Mida::DataType::Text
      end

      # The expected arrival time.
      has_many 'arrivalTime' do
        extract Mida::DataType::ISO8601Date
      end

      # The platform from which the train departs.
      has_many 'departurePlatform'

      # The station from which the train departs.
      has_many 'departureStation' do
        extract Mida::SchemaOrg::TrainStation
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

      # The name of the train (e.g. The Orient Express).
      has_many 'trainName'

      # The unique identifier for the train.
      has_many 'trainNumber'
    end

  end
end
