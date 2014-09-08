require 'mida_vocabulary/datatype'

module Mida
  module SchemaOrg

    # Enumerated status values for Reservation.
    class ReservationStatusType < Mida::DataType::Enumeration
      VALID_VALUES = [
        [::Mida::DataType::URL, %r{http://schema.org/}i]
      ]
    end

  end
end
