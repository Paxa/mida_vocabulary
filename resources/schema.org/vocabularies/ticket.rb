require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Used to describe a ticket to an event, a flight, a bus ride, etc.
    class Ticket < Mida::Vocabulary
      itemtype %r{http://schema.org/Ticket}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
