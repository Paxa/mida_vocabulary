require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # A delivery service through which content is provided via broadcast over the air or online.
    class BroadcastService < Mida::Vocabulary
      itemtype %r{http://schema.org/BroadcastService}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
