require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Reservation, 'mida_vocabulary/vocabularies/schemaorg/reservation'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A reservation for air travel.
    class FlightReservation < Mida::Vocabulary
      itemtype %r{http://schema.org/FlightReservation}i
      include_vocabulary Mida::SchemaOrg::Reservation
      include_vocabulary Mida::SchemaOrg::Thing

      # The airline-specific indicator of boarding order / preference.
      has_many 'boardingGroup'
    end

  end
end
