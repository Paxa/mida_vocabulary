require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Event, 'mida_vocabulary/vocabularies/schemaorg/event'
    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :BroadcastService, 'mida_vocabulary/vocabularies/schemaorg/broadcastservice'

    # A PublicationEvent corresponds indifferently to the event of publication for a CreativeWork of any type e.g. a broadcast event, an on-demand event, a book/journal publication via a variety of delivery media.
    class PublicationEvent < Mida::Vocabulary
      itemtype %r{http://schema.org/PublicationEvent}i
      include_vocabulary Mida::SchemaOrg::Event
      include_vocabulary Mida::SchemaOrg::Thing

      # A flag to signal that the publication is accessible for free.
      has_many 'free' do
        extract Mida::DataType::Boolean
      end

      # A broadcast service associated with the publication event.
      has_many 'publishedOn' do
        extract Mida::SchemaOrg::BroadcastService
        extract Mida::DataType::Text
      end
    end

  end
end
