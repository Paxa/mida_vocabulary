require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The geographic shape of a place.
    class GeoShape < Mida::Vocabulary
      itemtype %r{http://schema.org/GeoShape}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
