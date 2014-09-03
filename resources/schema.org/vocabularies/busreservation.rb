require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Reservation, 'mida_vocabulary/vocabularies/schemaorg/reservation'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A reservation for bus travel.
    class BusReservation < Mida::Vocabulary
      itemtype %r{http://schema.org/BusReservation}i
      include_vocabulary Mida::SchemaOrg::Reservation
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
