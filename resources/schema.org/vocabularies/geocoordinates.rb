require 'mida_vocabulary/vocabulary'

module Mida
  module SchemaOrg

    autoload :Thing, 'mida_vocabulary/vocabularies/schemaorg/thing'

    # The geographic coordinates of a place or event.
    class GeoCoordinates < Mida::Vocabulary
      itemtype %r{http://schema.org/GeoCoordinates}i
      include_vocabulary Mida::SchemaOrg::Thing
    end

  end
end
