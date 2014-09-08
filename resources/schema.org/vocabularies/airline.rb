require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An organization that provides flights for passengers.
    class Airline < Mida::Vocabulary
      itemtype %r{http://schema.org/Airline}i
      include_vocabulary Mida::SchemaOrg::Organization
      include_vocabulary Mida::SchemaOrg::Thing

      # IATA identifier for an airline or airport
      has_many 'iataCode'
    end

  end
end
