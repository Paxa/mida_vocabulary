require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :QualitativeValue, 'mida_vocabulary/vocabularies/schemaorg/qualitativevalue'

    # Used to describe a seat, such as a reserved seat in an event reservation.
    class Seat < Mida::Vocabulary
      itemtype %r{http://schema.org/Seat}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The location of the reserved seat (e.g., 27).
      has_many 'seatNumber'

      # The row location of the reserved seat (e.g., B).
      has_many 'seatRow'

      # The section location of the reserved seat (e.g. Orchestra).
      has_many 'seatSection'

      # The type/class of the seat.
      has_many 'seatingType' do
        extract Mida::SchemaOrg::QualitativeValue
        extract Mida::DataType::Text
      end
    end

  end
end
