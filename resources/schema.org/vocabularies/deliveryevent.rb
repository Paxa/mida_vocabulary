require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # An event involving the delivery of an item.
    class DeliveryEvent < Mida::Vocabulary
      itemtype %r{http://schema.org/DeliveryEvent}i
      include_vocabulary Mida::SchemaOrg::Event
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
