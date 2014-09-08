require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Reservation, 'mida_vocabulary/vocabularies/schemaorg/reservation'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A group of multiple reservations with common values for all sub-reservations.
    class ReservationPackage < Mida::Vocabulary
      itemtype %r{http://schema.org/ReservationPackage}i
      include_vocabulary Mida::SchemaOrg::Reservation
      include_vocabulary Mida::SchemaOrg::Thing

      # The individual reservations included in the package. Typically a repeated property.
      has_many 'subReservation' do
        extract Mida::SchemaOrg::Reservation
        extract Mida::DataType::Text
      end
    end

  end
end
