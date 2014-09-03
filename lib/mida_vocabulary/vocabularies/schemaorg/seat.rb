require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Used to describe a seat, such as a reserved seat in an event reservation.
    class Seat < Mida::Vocabulary
      itemtype %r{http://schema.org/Seat}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
