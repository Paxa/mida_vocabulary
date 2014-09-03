require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Describes a reservation for travel, dining or an event. Some reservations require tickets.
    class Reservation < Mida::Vocabulary
      itemtype %r{http://schema.org/Reservation}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
