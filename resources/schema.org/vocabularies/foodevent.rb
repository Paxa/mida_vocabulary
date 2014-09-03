require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # Event type: Food event.
    class FoodEvent < Mida::Vocabulary
      itemtype %r{http://schema.org/FoodEvent}i
      include_vocabulary Mida::SchemaOrg::Event
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
