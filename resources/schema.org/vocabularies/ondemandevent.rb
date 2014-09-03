require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :PublicationEvent, 'mida_vocabulary/vocabularies/schemaorg/publicationevent'
    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A publication event e.g. catch-up TV or radio podcast, during which a program is available on-demand.
    class OnDemandEvent < Mida::Vocabulary
      itemtype %r{http://schema.org/OnDemandEvent}i
      include_vocabulary Mida::SchemaOrg::PublicationEvent
      include_vocabulary Mida::SchemaOrg::Event
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
