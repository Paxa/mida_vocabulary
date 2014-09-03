require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Reservation, 'mida_vocabulary/vocabularies/schemaorg/reservation'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A reservation for a taxi.
    class TaxiReservation < Mida::Vocabulary
      itemtype %r{http://schema.org/TaxiReservation}i
      include_vocabulary Mida::SchemaOrg::Reservation
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
