require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'
    autoload :Place, 'mida_vocabulary/vocabularies/schemaorg/place'
    autoload :Organization, 'mida_vocabulary/vocabularies/schemaorg/organization'
    autoload :BroadcastService, 'mida_vocabulary/vocabularies/schemaorg/broadcastservice'

    # A delivery service through which content is provided via broadcast over the air or online.
    class BroadcastService < Mida::Vocabulary
      itemtype %r{http://schema.org/BroadcastService}i
      include_vocabulary Mida::SchemaOrg::Thing

      # The area within which users can expect to reach the broadcast service.
      has_many 'area' do
        extract Mida::SchemaOrg::Place
        extract Mida::DataType::Text
      end

      # The organization owning or operating the broadcast service.
      has_many 'broadcaster' do
        extract Mida::SchemaOrg::Organization
        extract Mida::DataType::Text
      end

      # A broadcast service to which the broadcast service may belong to such as regional variations of a national channel.
      has_many 'parentService' do
        extract Mida::SchemaOrg::BroadcastService
        extract Mida::DataType::Text
      end
    end

  end
end
