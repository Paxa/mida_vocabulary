require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PublicationEvent, 'mida_vocabulary/vocabularies/schemaorg/publicationevent'
    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An over the air or online broadcast event.
    class BroadcastEvent < Mida::Vocabulary
      itemtype %r{http://schema.org/BroadcastEvent}i
      include_vocabulary Mida::SchemaOrg::PublicationEvent
      include_vocabulary Mida::SchemaOrg::Event
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
